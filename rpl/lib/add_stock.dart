import 'package:flutter/material.dart';
import 'add_penjualan.dart';
class Add_stock extends StatefulWidget {
  const Add_stock({super.key});

  @override
  State<Add_stock> createState() => _Add_stockState();
}

class _Add_stockState extends State<Add_stock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      width: 60,
                    ),
                    new Text(
                      'Input Data',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300]),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Container(
                      height: 450,
                      width: 340,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[300]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(
                            'Stock barang',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          new Text(
                            'Nama Barang',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Inputan(
                            Hinttext: 'Masukkan Nama Barang',
                          ),
                          new Text(
                            'Kode Barang',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Inputan(
                            Hinttext: 'Masukkan Kode Barang',
                          ),
                          new Text(
                            'Jenis Barang',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Inputan(
                            Hinttext: 'Masukkan Jenis Barang',
                          ),
                           new Text(
                            'Harga',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Inputan(
                            Hinttext: 'Masukkan Harga Barang',
                          ),

                           new Text(
                            'Jumlah Stock barang',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Inputan(
                            Hinttext: 'Masukkan Jumlah Stock Barang',
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 18, 103, 70),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}