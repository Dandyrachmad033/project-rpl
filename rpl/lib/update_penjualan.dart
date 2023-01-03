import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rpl/controller/database_controller.dart';

class Update_Data extends StatefulWidget {
  Update_Data(
      {Key? key,
      required this.namaCustomer,
      required this.alamat,
      required this.noHp,
      required this.namaBarang,
      required this.kode,
      required this.jenis,
      required this.harga,
      required this.jumlah})
      : super(key: key);
  final String namaCustomer;
  final String alamat;
  final String noHp;
  final String namaBarang;
  final String kode;
  final String jenis;
  final int harga;
  final int jumlah;

  @override
  State<Update_Data> createState() => _Update_DataState();
}

class _Update_DataState extends State<Update_Data> {
  String namaEdit = '';
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
  void initState() {
    setState(() {
      namaEdit = widget.namaCustomer;
    });
    namaCustomer.text = widget.namaCustomer;
    alamat.text = widget.alamat;
    noHp.text = widget.noHp;
    namaBarang.text = widget.namaBarang;
    kode.text = widget.kode;
    jenis.text = widget.jenis;
    harga.text = widget.harga.toString();
    jumlah.text = widget.jumlah.toString();

    super.initState();
  }

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
                      'Update Data',
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
                  dbC.editDBDataPembelian(
                      namaEdit,
                      namaCustomer.text,
                      alamat.text,
                      noHp.text,
                      namaBarang.text,
                      kode.text,
                      jenis.text,
                      int.parse(harga.text),
                      int.parse(jumlah.text));
                  Navigator.pop(context);
                  Get.back();
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
                    "Update",
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
