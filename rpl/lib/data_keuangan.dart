import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/add_keuangan.dart';
import 'package:rpl/controller/auth_controller.dart';
import 'package:rpl/widget/primary_button.dart';
import 'add_penjualan.dart';

class Keuangan extends StatefulWidget {
  const Keuangan({super.key});

  @override
  State<Keuangan> createState() => _KeuanganState();
}

class _KeuanganState extends State<Keuangan> {
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
                      'Data Keuangan',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                height: 65,
                color: Colors.white,
                child: Row(children: [
                  new Text(
                    ' Expenses',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 250,
                  ),
                  new IconButton(
                      onPressed: () {
                        if (authC.emailUser == 'owner@gmail.com') {
                          Get.to(() => Add_Keuangan());
                        } else {
                          Get.defaultDialog(
                            title: "Warning, Tidak Bisa Mengolah Data!",
                            middleText:
                                "Kamu bukan anggota yang bisa mengolah data keuangan!",
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
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      )),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
