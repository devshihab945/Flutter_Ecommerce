import 'package:eco_mart/app/app.dart';
import 'package:eco_mart/app/urls.dart';
import 'package:eco_mart/core/service/network/network_client.dart';
import 'package:eco_mart/features/auth/data/models/login_model.dart';
import 'package:eco_mart/features/auth/ui/controller/auth_controller.dart';
import 'package:eco_mart/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:eco_mart/features/home/ui/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoginController extends GetxController{
  bool isLoading = false ;

  Future<void>login ({required String email, required String password} )async{
    isLoading = true;
    update();

    final String url = Urls.loginUrls;
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password
    };
    NetworkResponse response = await Get.find<NetworkClient>().postRequest(url: url, body: requestBody);

    if(response.statusCode == 200 || response.statusCode == 201){
      LoginModel information = LoginModel.fromJson(response.responseBody!);

     await AuthController.saveUserInformation(userToken: information.userData.token, user: information.userData.user.toJson());
     await AuthController.getUserInformation();


      Logger().i('''
      =>>   ${information.message}
      =>>   ${information.userData.token}
      =>>   ${information.userData.user.firstName}
      ''');

      navigatorKey.currentState?.pushNamedAndRemoveUntil(MainBottomNavScreen.name, (predicate)=>false);
    }else {
      Get.snackbar('Sorry', response.errorMessage!);
    }

    isLoading = false;
    update();
  }

}