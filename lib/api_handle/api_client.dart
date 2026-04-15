import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:mighty_job/api_handle/error_response.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'dart:io' as io;



class ApiClient extends GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;

  late String token;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.token) ?? '';
    if(kDebugMode) {
      print('Token: $token');
    }
    updateHeader(token);
  }

  void updateHeader(String token, {String? deviceInfo, String? location}) {
    final currentDomain = AppConstants.domain;
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept' : 'application/json',
      'platform' : "app",
      'appversion': AppConstants.version,
      'deviceinfo' : deviceInfo??'',
      'location' : location??'',
      'Authorization': 'Bearer $token',
      'X-Domain' : currentDomain,
    };
    _mainHeaders = header;
  }



  Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      if(kDebugMode) {
        log('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      http.Response response = await http.get(
        Uri.parse(appBaseUrl+uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if(kDebugMode) {
        log('====> API Call: $uri\nHeader: $_mainHeaders');
        log('====> API Body: $body');
      }
      http.Response response = await http.post(
        Uri.parse(appBaseUrl+uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      log(e.toString());
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }



  Future<dynamic> fileDownload(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if(kDebugMode) {
        log('====> API Call: $uri\nHeader: $_mainHeaders');
        log('====> API Body: $body');
      }
      http.Response response = await http.post(Uri.parse(appBaseUrl+uri), body: jsonEncode(body),
        headers: headers ?? _mainHeaders,).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }
  Future<Response> updateMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody, MultipartBody? logo, List<MultipartDocument> otherFile,  {Map<String, String>? headers}) async {
    try {
      if(kDebugMode) {
        log('====> API Call: $uri\nHeader: $_mainHeaders');
        log('====> API Body: $body with ${multipartBody.length} picture');
      }
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(appBaseUrl+uri));
      request.headers.addAll(headers ?? _mainHeaders);




      if(logo != null){
        if(logo.file != null) {
          Uint8List list = await logo.file!.readAsBytes();
          request.files.add(http.MultipartFile(
            logo.key, logo.file!.readAsBytes().asStream(), list.length,
            filename: '${DateTime.now().toString()}.png',
          ));
        }
      }


      for(MultipartBody multipart in multipartBody) {
        if(multipart.file != null) {
          Uint8List list = await multipart.file!.readAsBytes();
          request.files.add(http.MultipartFile(
            multipart.key, multipart.file!.readAsBytes().asStream(), list.length,
            filename: '${DateTime.now().toString()}.png',
          ));
        }
      }

      if(otherFile.isNotEmpty){
        for(MultipartDocument file in otherFile){
          File aaa = File(file.file!.path!);
          Uint8List list0 = await aaa.readAsBytes();
          var part = http.MultipartFile('upload_documents[]', aaa.readAsBytes().asStream(), list0.length, filename: basename(aaa.path));
          request.files.add(part);
        }
      }



      request.fields.addAll(body);
      http.Response response = await http.Response.fromStream(await request.send());
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }



  Future<Response> postMultipartData(String uri, Map<String, dynamic> body,
      List<MultipartBody> multipartBody, MultipartBody? logo,
      List<MultipartDocument> otherFile, {
        Map<String, String>? headers,
        MultipartDocument? videoFile,
        bool isUpdate = false
      }) async {
    try {
      final request = http.MultipartRequest(isUpdate? 'PUT' : 'POST', Uri.parse(appBaseUrl + uri));
      request.headers.addAll(headers ?? _mainHeaders);
      /// ---------------- LOGO ----------------
      if (logo?.file != null) {
        await _addXFile(request: request, key: logo!.key, file: logo.file!);
      }

      /// ---------------- IMAGES ----------------
      for (final multipart in multipartBody) {
        if (multipart.file != null) {
          await _addXFile(request: request, key: multipart.key, file: multipart.file!);
        }
      }

      /// ---------------- DOCUMENTS ----------------
      for (final file in otherFile) {
        if (file.file != null) {
          await _addPlatformFile(request: request, key: '${file.key}[]', file: file.file!);
        }
      }


      /// ---------------- VIDEO ----------------
      if (videoFile?.file != null) {
        await _addPlatformFile(request: request, key: videoFile!.key, file: videoFile.file!);
      }

      /// ---------------- BODY ----------------
      body.forEach((key, value) {
        if (value == null) return;
        if (value is List) {
          for (int i = 0; i < value.length; i++) {
            final item = value[i];
            if (item is Map) {
              item.forEach((subKey, subValue) {
                request.fields['$key[$i][$subKey]'] = subValue.toString();
              });
            } else {
              request.fields['$key[$i]'] = item.toString();
            }
          }
        } else if (value is Map) {
          value.forEach((subKey, subValue) {
            request.fields['$key[$subKey]'] = subValue.toString();
          });
        } else {
          request.fields[key] = value.toString();
        }
      });

      if (kDebugMode) {
        log("API BODY:");
        log(jsonEncode(request.fields));
      }


      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      return handleResponse(response, uri);
    } catch (e, stack) {
      if (kDebugMode) {
        log("POST Multipart Error: $e\n$stack");
      }
      return Response(statusCode: 1, statusText: "Upload error: $e");
    }
  }

  Future<void> _addXFile({
    required http.MultipartRequest request,
    required String key,
    required XFile file,
  }) async {
    if (kIsWeb) {
      final bytes = await file.readAsBytes();
      request.files.add(http.MultipartFile.fromBytes(key, bytes, filename: file.name),
      );
    } else {
      request.files.add(await http.MultipartFile.fromPath(key, file.path, filename: file.name));
    }
  }

  Future<void> _addPlatformFile({required http.MultipartRequest request,
    required String key, required PlatformFile file}) async {
    if (kIsWeb) {
      if (file.bytes == null) return;
      request.files.add(http.MultipartFile.fromBytes(key, file.bytes!, filename: file.name));
    } else {
      if (file.path == null) return;
      request.files.add(await http.MultipartFile.fromPath(key, file.path!, filename: file.name),);
    }
  }






  Future<Response> uploadFile(String uri, Map<String, String> body, MultipartBody? image, {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        log('====> API Call: $uri\nHeader: $_mainHeaders');
        log('====> API Body: $body with ${image?.key} picture');
      }

      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      request.headers.addAll(headers ?? _mainHeaders);
      if (image != null && image.file != null) {
        Uint8List fileBytes = await image.file!.readAsBytes();
        request.files.add(http.MultipartFile.fromBytes(
          image.key, fileBytes,
          filename: basename(image.file!.name),
        ));
      }
      request.fields.addAll(body);
      http.Response response = await http.Response.fromStream(await request.send());
      return handleResponse(response, uri);
    } catch (e, stack) {
      if (kDebugMode) {
        log("POST error: $e\n$stack");
      }
      return Response(statusCode: 1, statusText: "Upload error: $e");
    }
  }



  Future<Uint8List> getFileBytes(PlatformFile file) async {
    if (kIsWeb) {
      return file.bytes!;
    } else {
      return await io.File(file.path!).readAsBytes();
    }
  }



  Future<Response> postMultipartDataConversation(
      String? uri,
      Map<String, String> body,
      List<MultipartBody>? multipartBody,
      {Map<String, String>? headers,PlatformFile? otherFile}) async {

    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(appBaseUrl+uri!));
    request.headers.addAll(headers ?? _mainHeaders);

    if(otherFile != null) {
      request.files.add(http.MultipartFile('files[${multipartBody!.length}]', otherFile.readStream!, otherFile.size, filename: basename(otherFile.name)));
    }
    if(multipartBody!=null){
      for(MultipartBody multipart in multipartBody) {
        Uint8List list = await multipart.file!.readAsBytes();
        request.files.add(http.MultipartFile(
          multipart.key, multipart.file!.readAsBytes().asStream(), list.length, filename:'${DateTime.now().toString()}.png',
        ));
      }
    }
    request.fields.addAll(body);
    http.Response response = await http.Response.fromStream(await request.send());
    return handleResponse(response, uri);
  }



  Future<Response> putData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if(kDebugMode) {
        log('====> API Call: $uri\nHeader: $_mainHeaders');
        log('====> API Body: $body');
      }
      http.Response response = await http.put(
        Uri.parse(appBaseUrl+uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      // _chuckerHttpClient.put(Uri.parse('$appBaseUrl$uri'), body: jsonEncode(body));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri, {Map<String, String>? headers}) async {
    try {
      if(kDebugMode) {
        log('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      http.Response response = await http.delete(
        Uri.parse(appBaseUrl+uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      // _chuckerHttpClient.delete(Uri.parse('$appBaseUrl$uri'));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> handleResponse(http.Response response, String uri) async {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (e) {
      log('Error parsing response body: $e');
    }

    Response localResponse = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
        headers: response.request!.headers,
        method: response.request!.method,
        url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase);

    if (localResponse.statusCode != 200 && localResponse.body != null && localResponse.body is! String) {
      if (localResponse.body.toString().startsWith('{errors: [{code:')) {
        try {
          ErrorResponse errorResponse = ErrorResponse.fromJson(localResponse.body);
          localResponse = Response(statusCode: localResponse.statusCode,
            body: localResponse.body, statusText: errorResponse.errors![0].message);
        } catch (e) {
          log('Error parsing error response: $e');
        }
      } else if (localResponse.body.toString().startsWith('{message')) {
        localResponse = Response(statusCode: localResponse.statusCode,
          body: localResponse.body, statusText: localResponse.body['message'] ?? 'Unknown message',
        );
      }
    } else if (localResponse.statusCode != 200 && localResponse.body == null) {
      localResponse = const Response(statusCode: 0, statusText: 'No internet connection', body: 'No internet connection',
      );
    }

    log('====> API Response: [${localResponse.statusCode}] $uri\n${localResponse.body}');
    return localResponse;
  }
}

class MultipartBody {
  String key;
  XFile? file;
  MultipartBody(this.key, this.file);
}

class MultipartDocument {
  String key;
  PlatformFile? file;
  MultipartDocument(this.key, this.file);
}
