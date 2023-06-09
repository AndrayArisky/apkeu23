/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class data {
  final String kode_akun;
  final String nm_akun;
  final String grup;
  final String status;

  data({
    required this.kode_akun,
    required this.nm_akun,
    required this.grup,
    required this.status
  });
}

class nmAkunPage extends StatefulWidget {
  const nmAkunPage({super.key});

  @override
  State<nmAkunPage> createState() => _nmAkunPageState();
}

class _nmAkunPageState extends State<nmAkunPage> {
  List<dynamic> namaAkun = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final response = await http.get(Uri.parse('http://apkeu2023.000webhostapp.com/getdata.php?'));
    if (response.statusCode == 200) {
      setState(() {
        namaAkun = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

}
*/
