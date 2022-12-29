import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/controller/auth_controller.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final email = TextEditingController();
  final password = TextEditingController();

  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Center(
              child: Text(
            "Log In",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
                controller: email,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 224, 222, 222),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 18, 103, 70)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Email',
                    focusColor: Color.fromARGB(255, 18, 103, 70),
                    hintText: 'Enter valid email id as')),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 222, 222),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 18, 103, 70)),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Password',
                hintText: 'Enter valid email id as',
                focusColor: Color.fromARGB(255, 18, 103, 70),
              ),
            ),
          ),
          GetBuilder<AuthController>(
            init: authC,
            builder: (controller) => Container(
              padding: EdgeInsets.only(left: 10),
              height: 20,
              child: Text(
                controller.checkLogin ? "" : "Login Failed",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    authC.login(email.text, password.text);
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 18, 103, 70),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                        child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 18, 103, 70),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
