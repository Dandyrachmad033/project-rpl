import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/controller/database_controller.dart';

class Input_data extends StatefulWidget {
  const Input_data({super.key});

  @override
  State<Input_data> createState() => _Input_dataState();
}

class _Input_dataState extends State<Input_data> {
  final namaCustomer = TextEditingController();
  final alamat = TextEditingController();
  final noHp = TextEditingController();
  final namaBarang = TextEditingController();
  final kode = TextEditingController();
  final jenis = TextEditingController();
  final harga = TextEditingController();
  final jumlah = TextEditingController();

  final dbC = Get.put(DatabaseController());

  @override
  void dispose() {
    namaCustomer.dispose();
    alamat.dispose();
    noHp.dispose();
    namaBarang.dispose();
    kode.dispose();
    jenis.dispose();
    harga.dispose();
    jumlah.dispose();
    super.dispose();
  }

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
                  height: MediaQuery.of(context).size.height * .7,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300]),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
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
                          controller: namaCustomer,
                        ),
                        new Text(
                          'Alamat',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Inputan(
                          Hinttext: 'Masukkan Alamat',
                          controller: alamat,
                        ),
                        new Text(
                          'No HP',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Inputan(
                          Hinttext: 'Masukkan Nomor Hp anda',
                          controller: noHp,
                        ),
                        const SizedBox(
                          height: 20,
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
                          controller: namaBarang,
                        ),
                        new Text(
                          'Kode Barang',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Inputan(
                          Hinttext: 'Masukkan Kode Barang ',
                          controller: kode,
                        ),
                        new Text(
                          'Jenis Barang',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Inputan(
                          Hinttext: 'Masukkan Jenis Barang',
                          controller: jenis,
                        ),
                        new Text(
                          'Harga',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Inputan(
                          Hinttext: 'Masukkan Harga Barang',
                          controller: harga,
                        ),
                        new Text(
                          'Jumlah Pembelian',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Inputan(
                          Hinttext: 'Masukkan Jumlah Pembelian',
                          controller: jumlah,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  dbC.tambahDBDataPembelian(
                      namaCustomer.text,
                      alamat.text,
                      noHp.text,
                      namaBarang.text,
                      kode.text,
                      jenis.text,
                      int.parse(harga.text),
                      int.parse(jumlah.text));
                  Navigator.pop(context);
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
                    "Tambah",
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
  Inputan({super.key, this.Hinttext, required this.controller});
  final String? Hinttext;
  TextEditingController controller = TextEditingController();

  @override
  State<Inputan> createState() => _InputanState();
}

class _InputanState extends State<Inputan> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextField(
        controller: widget.controller,
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
