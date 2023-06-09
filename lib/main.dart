import 'package:apkeu23/inputTransaksi/tabBarInput.dart';
import 'package:apkeu23/namaAkunPage.dart';
import 'package:apkeu23/navBar.dart';
import 'package:apkeu23/nmAkunPage.dart';
import 'package:apkeu23/splash.dart';
import 'package:apkeu23/transaksiPage.dart';
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
      home: transaksi()
    );
  }
}