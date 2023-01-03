import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/controller/auth_controller.dart';
import 'package:rpl/widget/primary_button.dart';
import 'home.dart';
import 'add_stock.dart';

class Data_stock extends StatefulWidget {
  const Data_stock({super.key});

  @override
  State<Data_stock> createState() => _Data_stockState();
}

class _Data_stockState extends State<Data_stock> {
  final authC = Get.find<AuthController>();
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
                    TextButton(
                        onPressed: () {
                          if (authC.emailUser != 'marketing@gmail.com' &&
                              authC.emailUser != 'admin@gmail.com') {
                            Get.to(Add_stock());
                          } else {
                            Get.defaultDialog(
                              title: "Warning, Tidak Bisa Mengolah Data!",
                              middleText:
                                  "Kamu bukan anggota yang bisa mengolah data stok!",
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
                        child: new Text(
                          'new',
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        )),
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
