import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  List dataPembelian = [];
  var statusDataPemberlian = false.obs;

  void tambahDBDataPembelian(
      String namaCustomer,
      String alamat,
      String noHp,
      String namaBarang,
      String kode,
      String jenis,
      int harga,
      int jumlahPembelian) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("Data/pembelian");
    ref.push().set({
      "namaCustomer": namaCustomer,
      "alamat": alamat,
      "noHp": noHp,
      "namaBarang": namaBarang,
      "kode": kode,
      "jenis": jenis,
      "harga": harga,
      "jumlahPembelian": jumlahPembelian,
    });
    dataPembelian.add({
      "namaCustomer": namaCustomer,
      "alamat": alamat,
      "noHp": noHp,
      "namaBarang": namaBarang,
      "kode": kode,
      "jenis": jenis,
      "harga": harga,
      "jumlahPembelian": jumlahPembelian,
    });
    update();
  }

  void editDBDataPembelian(
      String namaEdit,
      String namaCustomer,
      String alamat,
      String noHp,
      String namaBarang,
      String kode,
      String jenis,
      int harga,
      int jumlahPembelian) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("Data/pembelian");

    ref.once().then((DatabaseEvent event) {
      Map<dynamic, dynamic> values = event.snapshot.value as Map;
      values.forEach((key, value) {
        if (value['namaCustomer'] == namaEdit) {
          ref.child(key).update({
            "namaCustomer": namaCustomer,
            "alamat": alamat,
            "noHp": noHp,
            "namaBarang": namaBarang,
            "kode": kode,
            "jenis": jenis,
            "harga": harga,
            "jumlahPembelian": jumlahPembelian,
          });
        }
      });
    });

    hapusDataPembelianList(namaEdit);

    dataPembelian.add({
      "namaCustomer": namaCustomer,
      "alamat": alamat,
      "noHp": noHp,
      "namaBarang": namaBarang,
      "kode": kode,
      "jenis": jenis,
      "harga": harga,
      "jumlahPembelian": jumlahPembelian,
    });
    update();
  }

  void bacaDataPembelian() {
    dataPembelian = [];

    DatabaseReference ref = FirebaseDatabase.instance.ref("Data/pembelian");
    ref.once().then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values = event.snapshot.value as Map;
        values.forEach((key, values) {
          dataPembelian.add(values);
        });
        update();
      }
    });
  }

  void hapusDataPembelian(String namaCustomer) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("Data/pembelian");
    ref.once().then((DatabaseEvent event) {
      Map<dynamic, dynamic> values = event.snapshot.value as Map;
      values.forEach((key, value) {
        if (value['namaCustomer'] == namaCustomer) {
          ref.child(key).remove();
        }
      });
    });
  }

  void hapusDataPembelianList(String namaCustomer) {
    for (int i = 0; i < dataPembelian.length; i++) {
      if (dataPembelian[i]['namaCustomer'] == namaCustomer) {
        dataPembelian.removeAt(i);
        break;
      }
    }
    update();
  }
}
