import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hivehomework/model/user_model.dart';
import 'package:hivehomework/packages/homework11.dart';
import 'package:hivehomework/service/dv_service.dart';
class HomePage extends StatefulWidget {
  static final String id="home_page1";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final passwordController=TextEditingController();
  final emailController=TextEditingController();
  final adressController=TextEditingController();
  void _doLogin ()async{
    String emailname=emailController.text.toString().trim();
    String password=passwordController.text.toString().trim();
    String address=adressController.text.toString().trim();
    var model=new User.from(username: emailname,password: password,address:address);
    HiveDB().storeUser(model);
    var user=HiveDB().loadUser();
    print(user.address);
    print(user.username);
    print(user.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            color: Colors.teal,
            height: 150,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25,),

                SizedBox(height: 10,),
                Text("Welcome",style: TextStyle(color: Colors.grey[400],fontSize: 17),),
                SizedBox(height: 5,),
                Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
              ],

            ),
          ),
          Expanded(

              child: Container(
                color: Colors.teal,
                child: Container(
                  // padding: EdgeInsets.all(30),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(height: 30,),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child:  Text("Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(.6)),),),

                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText:" Enter Email",
                              hintStyle: TextStyle(color: Colors.grey[400])
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child:  Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(.6)),),),

                      SizedBox(height: 5,),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              hintText:" Enter Password",
                              hintStyle: TextStyle(color: Colors.grey[400])
                          ),
                        ),
                      ),


                      SizedBox(height: 20,),
                      Padding(

                        padding: EdgeInsets.only(left: 30,right: 30),
                        child:  Text("Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(.6)),),),

                      SizedBox(height: 5,),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: TextField(
                          controller: adressController,
                          decoration: InputDecoration(
                              hintText:" Adress",
                              hintStyle: TextStyle(color: Colors.grey[400])
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(left: 50,right: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal
                        ),
                        child: Center(
                          child: FlatButton(
                            onPressed: _doLogin,
                            child: Text("SIgn In",style: TextStyle(color: Colors.white,fontSize: 18),),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 35,right: 20),

                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 2,
                              width:150,
                              color: Colors.grey[200],
                            ),
                            Text("OR",style: TextStyle(color: Colors.grey[300]),),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 2,
                              width:150,
                              color: Colors.grey[200],
                            ),


                          ],

                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 25,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 100,right: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Feather.facebook,color: Colors.blue,),
                            Icon(AntDesign.twitter,color: Colors.blue,),
                            Icon(AntDesign.instagram,color: Colors.black,)

                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          children: [
                            SizedBox(width: 120,),
                            Text("Don't have an account?"),
                            GestureDetector(
                              onTap: (){Navigator.pushNamed(context, HomePage2.id);},
                              child: Text("SignUp",style: TextStyle(color: Colors.blue[600],fontWeight: FontWeight.bold),),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),


                ),
              )
          ),
        ],
      ),

    );
  }
}
