import 'package:flutter/material.dart';
import 'home.dart';
import 'add_stock.dart';
class Data_stock extends StatefulWidget {
  const Data_stock({super.key});

  @override
  State<Data_stock> createState() => _Data_stockState();
}

class _Data_stockState extends State<Data_stock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: new Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    new Text(
                      'Stock Barang',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),

                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Add_stock()));
                    }, child: new Text('new', style: TextStyle(color: Colors.green, fontSize: 20),)),
                    
                  ],
                ),
              ),
             
            
            ],
          ),
        ),
      ),
    );
  }
}