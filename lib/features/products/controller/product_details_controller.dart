import 'package:eco_mart/app/urls.dart';
import 'package:eco_mart/core/service/network/network_client.dart';
import 'package:eco_mart/features/products/data/model/product_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ProductDetailsController extends GetxController {
  bool isLoading = false;

  ProductModel? productData;

  Future<void> getProduct(id) async {
    isLoading = true;
    update();

    productData = null;

    NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      url: Urls.productDetailsUrl(id: id),
    );

    if(response.statusCode == 200 || response.statusCode == 201){
      productData = ProductModel.fromJson(response.responseBody!['data']);
      update();

      Logger().t(productData!.sizes);
    }

    isLoading = false;
    update();
  }
}
