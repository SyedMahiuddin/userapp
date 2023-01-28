import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/pages/categorypage.dart';
import 'package:userapp/pages/loginpage.dart';
import 'package:userapp/pages/productdetail.dart';
import 'package:userapp/pages/signuppage.dart';

import 'Providers/shopprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ShopProvider()..getShopData("/locateShops/Bogra"),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoginPage.routeName,
        routes: {
          LoginPage.routeName:(context)=> LoginPage(),
          SignUpPage.routeName:(context)=> SignUpPage(),
          ProductDetailPage.routeName:(context)=> ProductDetailPage(),
          CategoryPage.routeName:(context)=> CategoryPage()
        },
      ),
    );
  }
}

