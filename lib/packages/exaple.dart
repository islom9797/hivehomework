
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivehomework/model/user_model.dart';
import 'package:hivehomework/service/dv_service.dart';

class HomePage3 extends StatefulWidget {
  static final String id = "home_page3";

  @override
  _HomePage3State createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin() async{
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user = new User(username: username,password: password);
    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser();
    print(user2.username);
    print(user2.password);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                icon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 10,),
            FlatButton(
              onPressed: _doLogin,
              color: Colors.blue,
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );


  }


}