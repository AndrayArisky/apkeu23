import 'package:apkeu23/inputTransaksi/tabBarInput.dart';
import 'package:apkeu23/inputTransaksiPage.dart';
import 'package:apkeu23/karyawanPage.dart';
import 'package:apkeu23/loginPage.dart';
import 'package:apkeu23/transaksiPage.dart';
import 'package:flutter/material.dart';

class transaksi extends StatefulWidget {
  @override
  _transaksiState createState() => _transaksiState();
}

class _transaksiState extends State<transaksi>{
  int _selectedIndex = 0;
  var selectedPage =  [
    tambahTransaksi(),
    Karyawan_Page(), 
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text('Catatan Keuangan'),
        elevation: 0,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => loginPage()),
                  (route) => false);
            }, child: Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => tabBarPage()));
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: selectedPage[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: AutomaticNotchedShape(
              RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  selectedPage[0];
                  setState(() {
                    _selectedIndex = 0;
                    print('Halaman Transaksi');
                  });
                }, 
                icon: Icon(
                  Icons.home_outlined,
                  color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                ),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  selectedPage[1];
                  setState(() {
                    _selectedIndex = 1;
                    print('Halaman Daftar Akun');
                  });
                }, 
                icon: Icon(
                  Icons.people_rounded,
                  color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                ),
                iconSize: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void Logout(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text("Anda berhasil logout!"),
      action:
          SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
