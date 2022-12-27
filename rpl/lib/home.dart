import 'package:flutter/material.dart';
import 'data_penjualan.dart';
import 'navibar.dart';

class Home extends StatelessWidget {
  

  final List<String> items = ['Data Keuangan','Data Penjualan','Stock Barang'];
  final List<int> colorCodes = [600, 400, 200];
  final List screens = ['askd',Penjualan(),'asjd'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    }, child: new Text('Log Out',style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),)),
                    
                    SizedBox(
                      width: 30,
                    ),
                    new Text('Dashboard',style: TextStyle(
                      fontSize: 30,fontWeight: FontWeight.bold
                    ),
                    )
                  ],
                ),
              ),
        
              Container(
                height: 800,
                child: ListView.builder(
                  itemCount: items.length ,
                  itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>screens[index]));
                    },
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.all(10),
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green[colorCodes[index]]
                      ),
                      child: Center(
                        child: Text(items[index]),
                      ),
                    ),
                  );
                }),
              ),
              
            
            ],
          ),
        ),
      ),

      

    );
  }
}