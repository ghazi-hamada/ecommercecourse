import 'package:ecommercecourse/core/services/servises.dart';
import 'package:get/get.dart';

translateDatabase({
  required String arabic,
  required String english,
}) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    
    return arabic;
  } else {
    return english;
  
    
  }
}
