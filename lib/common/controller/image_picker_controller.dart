
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/helper/image_size_checker.dart';

class ImagePickerController extends GetxController implements GetxService{
  XFile? icon;
  XFile? pickedImage;
  void pickImage({bool parentIdProof = false}) async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      icon = pickedImage;
    }
    update();
  }
}