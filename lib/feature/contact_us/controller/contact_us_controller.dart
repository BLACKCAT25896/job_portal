import 'package:get/get.dart';
import 'package:job/api_handle/api_checker.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/feature/contact_us/domain/model/contact_us_body.dart';
import 'package:job/feature/contact_us/domain/repository/contact_us_repository.dart';

class ContactUsController extends GetxController implements GetxService{
  ContactUsRepository contactUsRepository;
  ContactUsController({required this.contactUsRepository});

  bool isLoading = false;
  Future<Response> contactUs(ContactUsBody body) async {
    isLoading = true;
    update();
    Response response = await contactUsRepository.contactUs(body);
    if (response.statusCode == 200) {
      showCustomSnackBar("submitted_successfully".tr, isError: false);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
    return response;
  }

}