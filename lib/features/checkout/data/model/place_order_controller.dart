import 'package:eco_mart/app/app.dart';
import 'package:eco_mart/app/urls.dart';
import 'package:eco_mart/core/service/network/network_client.dart';
import 'package:eco_mart/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:get/get.dart';

class PlaceOrderController extends GetxController  {
  bool  isLoading= false ;


  Future<void>placeOrder(Map<String,dynamic> body)async{
    isLoading =true;
    update();

    NetworkResponse response = await Get.find<NetworkClient>().postRequest(url: Urls.createOrderUrl, body: body);
    if(response.statusCode == 200 || response.statusCode ==201 ){
      navigatorKey.currentState?.pushNamedAndRemoveUntil(MainBottomNavScreen.name, (predicate)=> false);
      Get.snackbar('Congratulation.!', 'Order successful');
    }else{
      Get.snackbar('Failed', response.errorMessage!);
    }


  }



}