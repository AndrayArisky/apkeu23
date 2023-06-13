import 'package:apkeu23/inputTransaksi/tabBarInput.dart';
import 'package:apkeu23/loginPage.dart';
import 'package:apkeu23/pages/inputTransaksiPage.dart';
import 'package:apkeu23/navBar.dart';
import 'package:apkeu23/karyawanPages/karyawanPage.dart';
import 'package:apkeu23/pages/namaAkunPage.dart';
import 'package:apkeu23/adminPages/profilAdmin.dart';
import 'package:apkeu23/splash.dart';
import 'package:apkeu23/pages/riwayatTransaksiPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aplikasi Keuangan UMKM",
      home: loginPage()
    );
  }
}