import 'package:flutter/material.dart';
import 'add_penjualan.dart';
class Penjualan extends StatefulWidget {
  const Penjualan({super.key});

  @override
  State<Penjualan> createState() => _PenjualanState();
}

class _PenjualanState extends State<Penjualan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView (
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
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: new Text('Back',style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),)),
                    
                    SizedBox(
                      width: 30,
                    ),
                    new Text('Data Penjualan',style: TextStyle(
                      fontSize: 30,fontWeight: FontWeight.bold
                    ),
                    ),

                    SizedBox(
                      width: 30,
                    ),

                    TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Input_data()));
                    }, child: new Text('New',style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),)),

                  ],
                ),
              ),

              Container(
                height: 500,
                width: 600,
                child: List_penjualan())
            ],
          ),
        ),
      ),
    );
  }
}


class List_penjualan extends StatelessWidget {
  const List_penjualan({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
         
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                
              ),
            ),
            
            
          ),
        ),
      );
    });
  }
}