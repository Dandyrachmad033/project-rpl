import 'package:flutter/material.dart';

class Input_data extends StatefulWidget {
  const Input_data({super.key});

  @override
  State<Input_data> createState() => _Input_dataState();
}

class _Input_dataState extends State<Input_data> {
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
                  height: 500,
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
                            'Costumer',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          new Text(
                            'Nama',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Inputan(
                            Hinttext: 'Masukkan nama',
                          ),
                          new Text(
                            'Alamat',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Inputan(
                            Hinttext: 'Masukkan Alamat',
                          ),
                          new Text(
                            'No HP',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Inputan(
                            Hinttext: 'Masukkan Nomor Hp anda',
                          ),
                          new Text(
                            'Barang',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          new Text(
                            'Nama Barang',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Inputan(
                            Hinttext: 'Masukkan nama Barang ',
                          ),
                          new Text(
                            'jenis Barang',
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
                            'Jumlah Pembelian',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Inputan(
                            Hinttext: 'Masukkan Jumlah Pembelian',
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

class Inputan extends StatefulWidget {
  final String? Hinttext;
  const Inputan({super.key, this.Hinttext});

  @override
  State<Inputan> createState() => _InputanState();
}

class _InputanState extends State<Inputan> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextField(
        decoration: InputDecoration(
          hintText: widget.Hinttext,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15, height: 2.5),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          contentPadding: EdgeInsets.all(15),
        ),
      ),
    );
  }
}
