import 'package:get/get.dart';
import 'package:shoppingcart/model.dart';
import 'package:shoppingcart/services.dart';



class ProductController extends GetxController
{
  var productList = <Product>[].obs;

  @override
  void onInit()
  {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    var products = await RemoteServices.fetchProducts();
    if(products != null)
      {
        productList.value = products;
      }

  }

}