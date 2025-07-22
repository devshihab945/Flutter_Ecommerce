import 'package:eco_mart/app/urls.dart';
import 'package:eco_mart/core/service/network/network_client.dart';
import 'package:get/get.dart';

class AddToWishListController extends GetxController{

  Future<void> addToWishList({required String id})async{

    NetworkResponse response = await  Get.find<NetworkClient>().postRequest(
        url: Urls.addToWishlistUrl,
        body: {"product": id}
    );

    if(response.statusCode == 200 || response.statusCode == 201){
      Get.snackbar('Grate..!', 'Successfully added to wishlist');
    }else{
      Get.snackbar('Sorry..!', '${response.errorMessage}');
    }
  }



}