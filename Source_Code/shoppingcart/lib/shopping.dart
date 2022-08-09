import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingcart/controller.dart';
import 'package:shoppingcart/product_tile.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();

}
class _ShoppingCartState extends State<ShoppingCart> {

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,color: Colors.black87,
        ),
        title: Center(child: Text("Shopping Cart",style: TextStyle(color: Colors.,fontSize: 22))),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,color: Colors.black87
            ),
            onPressed: () {},
          )
        ],
      ),
      body:
      Column(
          children: [
       Expanded(
         child: Obx(() => StaggeredGridView.countBuilder(
               crossAxisCount: 2,
               crossAxisSpacing: 16,
               mainAxisSpacing: 16,
               itemCount: productController.productList.length,
               itemBuilder:  (context,index){
                 return ProductTile(productController.productList[index]);
               },
               staggeredTileBuilder: (index)=>StaggeredTile.fit(1)
           ),
         ),

    )
      ]),


    );
  }
}
