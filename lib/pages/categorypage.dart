import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:userapp/Models/shopmodel.dart';

import '../Providers/shopprovider.dart';
class CategoryPage extends StatefulWidget {
  static const String routeName='/categorypage';
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}
List<String> categorylist=[];
List<dynamic> CityList=[];
String Cityid='';
List<shopmodel> ShopList = [];

class _CategoryPageState extends State<CategoryPage> {
  void initState(){
     CityList=['Dhaka','Bogra','Rajshahi'];
    super.initState();
  }
  String dropdownvalue = 'All Bangladesh';

// List of items in our dropdown menu
  var items = [
    'All Bangladesh',
    'Dhaka',
    'Bogra',
    'Rajshahi',
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.1,
        backgroundColor: Colors.white,
      ),
           body:  Column(
             children: [
               SizedBox(height: 15,),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width-20,
                 child:  DropdownButton(
                   value: dropdownvalue,
                   icon: const Icon(Icons.keyboard_arrow_down),
                   focusColor: Colors.blue,
                   dropdownColor: Colors.blue,
                   items: items.map((String items) {
                     return DropdownMenuItem(
                       value: items,
                       child: Text(items),
                     );
                   }).toList(),

                   onChanged: (String? newValue) {
                     setState(() {
                       dropdownvalue = newValue!;
                       Provider.of<ShopProvider>(context,listen: false).getShopData("/locateShops/${dropdownvalue}");
                       ShopList = Provider.of<ShopProvider>(context,listen: false).ShopList;
                     });
                   },
                 ),
              ),
               Container(
                 child: Consumer<ShopProvider>(
                   builder: (context,provider,child){
                     return Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                         height: 500,
                         width: MediaQuery.of(context).size.width,
                         child: GridView.builder(
                             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                 maxCrossAxisExtent: 200,
                                 childAspectRatio: 3 / 2,
                                 crossAxisSpacing: 20,
                                 mainAxisSpacing: 20),
                             itemCount: ShopList.length,
                             itemBuilder: (context, index){
                               return Container(
                                 child: Stack(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(15)
                                       ),
                                       child: ClipRRect(
                                         borderRadius: BorderRadius.circular(15),
                                         child: Image.network('${ShopList[index].shopImage}',fit: BoxFit.cover
                                           ,),
                                       ),
                                     ),
                                     Positioned(
                                       bottom:0,
                                       child: Opacity(
                                         opacity:0.8,
                                         child: Container(
                                           height: 65,
                                           width: 215,
                                           color: Colors.white,
                                         )
                                       ),
                                     ),
                                     Positioned(
                                       bottom:0,
                                       child: Column(
                                         children: [
                                           Text('${ShopList[index].shopName}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                           Row(
                                             children: [
                                               Icon(Icons.star,color: Colors.deepOrangeAccent,),
                                               Text('4.5',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                                             ],
                                           )
                                         ],
                                       ),
                                     )
                                   ],
                                 ),
                               );
                             }
                         ),
                       ),
                     );
                   },
                 )
               ),
             ],
           ),
    );
  }
}
