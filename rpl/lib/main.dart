import 'package:flutter/material.dart';
import 'home.dart';
void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Log In",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),)),
            
            Padding(padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 224, 222, 222),
                  enabledBorder :OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 18, 103, 70)),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Email',focusColor: Color.fromARGB(255, 18, 103, 70),
                hintText: 'Enter valid email id as'
              )
            ),),

            Padding(padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 224, 222, 222),
                  enabledBorder : OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 18, 103, 70)),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Password',
                hintText: 'Enter valid email id as',focusColor: Color.fromARGB(255, 18, 103, 70),
              ),),),
                
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                },
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 18, 103, 70),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(child: Text("Log In",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),)),
                ),
              ),
              
              TextButton(onPressed: (){
              
              }, child: Text("Forgot Password?",style: TextStyle(
                color: Color.fromARGB(255, 18, 103, 70),
                
                
              ),),),

              SizedBox(height: 150,),
          ],
        )),
    );
  }
}


