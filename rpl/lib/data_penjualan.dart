import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/controller/auth_controller.dart';
import 'package:rpl/controller/database_controller.dart';
import 'package:rpl/update_penjualan.dart';
import 'package:rpl/widget/primary_button.dart';
import 'add_penjualan.dart';

class Penjualan extends StatefulWidget {
  const Penjualan({super.key});

  @override
  State<Penjualan> createState() => _PenjualanState();
}

class _PenjualanState extends State<Penjualan> {
  final authC = Get.find<AuthController>();
  final dbC = Get.find<DatabaseController>();

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
                      'Data Penjualan',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          if (authC.emailUser != 'marketing@gmail.com' &&
                              authC.emailUser != 'stok@gmail.com') {
                            Get.to(Input_data());
                          } else {
                            Get.defaultDialog(
                              title: "Warning, Tidak Bisa Mengolah Data!",
                              middleText:
                                  "Kamu bukan anggota yang bisa mengolah data penjualan!",
                              backgroundColor: Colors.white,
                              buttonColor: Colors.green[200],
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              confirm: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: PrimaryButton(
                                  title: "okei",
                                  width: 100.0,
                                  height: 30.0,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'New',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: 600,
                  child: List_Penjualan(context))
            ],
          ),
        ),
      ),
    );
  }

  Widget List_Penjualan(BuildContext context) {
    return GetBuilder(
      init: dbC,
      initState: (_) => dbC.bacaDataPembelian(),
      builder: (controller) => Container(
        child: dbC.dataPembelian.length == 0
            ? Center(
                child: Text(
                  "Data Empty",
                  style: TextStyle(color: Colors.black),
                ),
              )
            : ListView.builder(
                itemCount: dbC.dataPembelian.length,
                itemBuilder: (context, index) {
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
                      child: ListTile(
                        leading: Icon(
                          Icons.circle,
                          color: Colors.green,
                        ),
                        title: Text(dbC.dataPembelian[index]['namaCustomer'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            )),
                        trailing: TextButton(
                            onPressed: () {
                              Get.defaultDialog(
                                  title:
                                      "Detail Data ${dbC.dataPembelian[index]['namaCustomer']}",
                                  content: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    height:
                                        MediaQuery.of(context).size.height * .4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Nama Customer : ${dbC.dataPembelian[index]['namaCustomer']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "Alamat : ${dbC.dataPembelian[index]['alamat']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "No HP : ${dbC.dataPembelian[index]['noHp']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "Nama Barang : ${dbC.dataPembelian[index]['namaBarang']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "Kode Barang : ${dbC.dataPembelian[index]['kode']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "Jenis Barang : ${dbC.dataPembelian[index]['jenis']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "Harga Barang : ${dbC.dataPembelian[index]['harga']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "Jumlah Barang : ${dbC.dataPembelian[index]['jumlahPembelian']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  buttonColor: Colors.green[200],
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  cancel: authC.emailUser != 'stok@gmail.com' &&
                                          authC.emailUser !=
                                              'marketing@gmail.com'
                                      ? GestureDetector(
                                          onTap: () {
                                            Get.to(Update_Data(
                                                namaCustomer:
                                                    dbC.dataPembelian[index]
                                                        ['namaCustomer'],
                                                alamat: dbC.dataPembelian[index]
                                                    ['alamat'],
                                                noHp: dbC.dataPembelian[index]
                                                    ['noHp'],
                                                namaBarang:
                                                    dbC.dataPembelian[index]
                                                        ['namaBarang'],
                                                kode: dbC.dataPembelian[index]
                                                    ['kode'],
                                                jenis: dbC.dataPembelian[index]
                                                    ['jenis'],
                                                harga: dbC.dataPembelian[index]
                                                    ['harga'],
                                                jumlah: dbC.dataPembelian[index]
                                                    ['jumlahPembelian']));
                                          },
                                          child: PrimaryButton(
                                            title: "Update",
                                            width: 100.0,
                                            height: 30.0,
                                          ),
                                        )
                                      : null,
                                  confirm:
                                      authC.emailUser != 'stok@gmail.com' &&
                                              authC.emailUser !=
                                                  'marketing@gmail.com'
                                          ? GestureDetector(
                                              onTap: () {
                                                dbC.hapusDataPembelian(
                                                    dbC.dataPembelian[index]
                                                        ['namaCustomer']);
                                                dbC.hapusDataPembelianList(
                                                    dbC.dataPembelian[index]
                                                        ['namaCustomer']);
                                                Get.back();
                                              },
                                              child: PrimaryButton(
                                                title: "Hapus",
                                                width: 100.0,
                                                height: 30.0,
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: PrimaryButton(
                                                title: "Okei",
                                                width: 100.0,
                                                height: 30.0,
                                              ),
                                            ));
                            },
                            child: Text(
                              'Detail',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            )),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
