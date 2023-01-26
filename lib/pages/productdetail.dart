import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  static const String routeName='/productdetailpage';
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag,color: Colors.black,size: 30,))
        ],
      ),
      body:SingleChildScrollView(
        child:   Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/tshirt.jpg'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Fashion'),
                      Text('TShirt',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.star,color: Colors.amber),),
                          Text('5.0'),
                        ],
                      ),
                      Text('BDT 200',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                    ],
                  ),
                )
              ],
            ),
            Text('Size'),

          ],
        ),
      ),
    );
  }
}
