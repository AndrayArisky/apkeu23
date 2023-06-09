import 'package:apkeu23/loginPage.dart';
import 'package:flutter/material.dart';

class Karyawan_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Karyawan"), // Judul AppBar
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => loginPage()),
                  (route) => false);
            },
            child: Text(
              "Logout",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Halaman Karyawan",
          style: TextStyle(fontSize: 24, color: Colors.red),
        ),
      ),
    );
  }
}
