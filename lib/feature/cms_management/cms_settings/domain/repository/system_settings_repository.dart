import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/domain/model/cms_section_reorder_body.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/domain/model/general_settings_model.dart';
import 'package:mighty_job/util/app_constants.dart';

class SystemSettingsRepository{
  final ApiClient apiClient;
  SystemSettingsRepository({required this.apiClient});


  Future<Response?> getGeneralSetting () async {
    return await apiClient.getData(AppConstants.generalSetting);
  }

    Future<Response?> getGeneralPublicSetting () async {
    return await apiClient.getData(AppConstants.publicSetting);
  }



  Future<Response?> updateGeneralSetting (SettingItem body) async {
    return await apiClient.postData(AppConstants.generalSettingUpdate, {
      "site_title" : body.siteTitle,
      "phone" : body.phone,
      "email" : body.email,
      "address" : body.address,
      "header_notice" : body.headerNotice,
      "app_version" : body.appVersion,
      "app_url" : body.appUrl,
      "currency_symbol": body.currencySymbol
    });
  }

  Future<Response?> sideBarColorUpdate (String color) async {
    return await apiClient.postData(AppConstants.generalSettingUpdate, {
      "sidebar_selected_bg_color" : color,
    });
  }


  Future<Response?> sideBarTextColorUpdate (String color) async {
    return await apiClient.postData(AppConstants.generalSettingUpdate, {
      "sidebar_selected_text_color" : color,
    });
  }

  Future<Response?> primaryColorUpdate (String color) async {
    return await apiClient.postData(AppConstants.generalSettingUpdate , {
      "primary_color" : color,
    });
  }

  Future<Response?> secondaryColorUpdate (String color) async {
    return await apiClient.postData(AppConstants.generalSettingUpdate , {
      "secondary_color" : color,
    });
  }
  Future<Response?> primaryContainerColorUpdate (String color) async {
    return await apiClient.postData(AppConstants.generalSettingUpdate , {
      "primary_container_color" : color,
    });
  }
  Future<Response?> textColorUpdate (String color) async {
    return await apiClient.postData(AppConstants.generalSettingUpdate , {
      "text_color" : color,
    });
  }



  Future<Response?> uploadLogo(XFile? logo, String type, int id) async {
    if (logo == null) return null;
    MultipartBody body;
    if (type == "header") {
      body = MultipartBody("header_logo_light_theme", logo);
    } else if (type == "dark_header") {
      body = MultipartBody("header_logo_dark_theme", logo);
    }else if (type == "footer") {
      body = MultipartBody("footer_logo_light_theme", logo);
    } else {
      body = MultipartBody("footer_logo_dark_theme", logo);
    }
    return await apiClient.postMultipartData(
      "${AppConstants.mighty_jobImageSetting}/$id", {
        "_method" : "put"
    },
      [], body, []);
  }

  Future<Response?> getmighty_jobImageSetting () async {
    return await apiClient.getData(AppConstants.mighty_jobImageSetting);
  }


  Future<Response?> cmsSection () async {
    return await apiClient.getData(AppConstants.frontendCmsSection);
  }
  Future<Response?> cmsSectionReorder (CmsSectionReorderBody body) async {
    return await apiClient.postData(AppConstants.cmsSectionReorder, body.toJson());
  }

  Future<Response?> whatsappSetting (String whatsappNumber, int chatEnable, int orderEnable ) async {
    return await apiClient.postData(AppConstants.generalSettingUpdate , {
      "whatsapp_chat_url" : whatsappNumber,
      "whatsapp_chat_enable" : chatEnable,
      "whatsapp_order_enable" : orderEnable

    });
  }


  Future<Response?> facebookSetting (String pixelCode, int chatEnable, String chatUrl ) async {
    return await apiClient.postData(AppConstants.generalSettingUpdate , {
      "facebook_pixel_code" : pixelCode,
      "facebook_chat_enable" : chatEnable,
      "facebook_chat_url" : chatUrl

    });
  }

  Future<Response?> getDefaultTheme () async {
    return await apiClient.getData(AppConstants.themeAssign);
  }



  Future<Response?> setTheme(int shopId, int themeId) async {
    return await apiClient.postData(AppConstants.themeAssign,
        {
          "shop_id": shopId,
          "theme_id": themeId
        });

  }

}