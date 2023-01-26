import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/pages/productdetail.dart';
import 'package:userapp/pages/signuppage.dart';
import 'package:userapp/utils/colors.dart';

class LoginPage extends StatefulWidget {
  static const String routeName='/loginpage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final emailController = TextEditingController();
final passwordController = TextEditingController();
String dont="Don't have an account";
bool visiblepass=false;
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double scheight= MediaQuery.of(context).size.height;
    double scwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.1,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text('WELCOME',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Image.asset('images/logimage.png',height: 350,width: 400,),
                TextFormField(
                  controller: emailController,
                  decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black)
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: passwordController,
                  obscureText: !visiblepass,
                  decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.lock_outlined,color: Colors.black,),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      suffixIcon: visiblepass?IconButton(onPressed: (){
                        setState(() {
                          visiblepass? visiblepass=false: visiblepass=true;
                        });}, icon: Icon(Icons.visibility,color: Colors.black)):
                      IconButton(onPressed: (){setState(() {
                        visiblepass? visiblepass=false: visiblepass=true;
                      });}, icon: Icon(Icons.visibility_off,color: Colors.black,)),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black)
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 45,
                  width: scwidth-15,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: themeColorBlue,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      onPressed: ()  {
                        Navigator.pushNamed(context, ProductDetailPage.routeName);
                      },
                      child:  Text(
                        'Login',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(dont,style: TextStyle(fontSize: 20),),
                    TextButton(onPressed: (){ Navigator.pushReplacementNamed(context, SignUpPage.routeName);}, child: Text('Sign Up',style: TextStyle(color: greentext,fontSize: 20),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
