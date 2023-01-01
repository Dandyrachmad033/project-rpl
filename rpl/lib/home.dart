import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/controller/auth_controller.dart';
import 'data_penjualan.dart';
import 'navibar.dart';
import 'data_keuangan.dart';
import 'data_stock.dart';

class Home extends StatelessWidget {
  final authC = Get.find<AuthController>();
  final List<String> items = [
    'Data Keuangan',
    'Data Penjualan',
    'Stock Barang'
  ];
  final List<int> colorCodes = [600, 400, 200];
  final List screens = [Keuangan(), Penjualan(), 'asjd'];
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
                          authC.logOut();
                        },
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    new Text(
                      'Dashboard',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(Keuangan());
                    },
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: authC.emailUser == 'owner@gmail.com' ||
                                  authC.emailUser == 'ceo@gmail.com'
                              ? Colors.green[600]
                              : Colors.green[200]),
                      child: Center(
                        child: Text("Data Keuangan"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(Penjualan());
                    },
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[600]),
                      child: Center(
                        child: Text("Data Penjualan"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(Data_stock());
                    },
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: authC.emailUser != 'admin@gmail.com' &&
                                  authC.emailUser != 'marketing@gmail.com'
                              ? Colors.green[600]
                              : Colors.green[200]),
                      child: Center(
                        child: Text("Data Stok Barang"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
