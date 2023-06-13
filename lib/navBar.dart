import 'package:apkeu23/inputTransaksi/tabBarInput.dart';
import 'package:apkeu23/pages/inputTransaksiPage.dart';
import 'package:apkeu23/karyawanPages/karyawanPage.dart';
import 'package:apkeu23/loginPage.dart';
import 'package:apkeu23/pages/namaAkunPage.dart';
import 'package:apkeu23/adminPages/profilAdmin.dart';
import 'package:apkeu23/pages/riwayatTransaksiPage.dart';
import 'package:flutter/material.dart';

class transaksi extends StatefulWidget {
  @override
  _transaksiState createState() => _transaksiState();
}

class _transaksiState extends State<transaksi>{
  late final Widget? endDrawer;
  int _selectedIndex = 0;
  var selectedPage =  [
    transaksiPage(),
    namaAkun(),
    profilAdmin(), 
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Catatan Keuangan'),
        elevation: 2,
        /*     
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu
            ),
            onPressed: () {
              /*
              showModalBottomSheet(
                context: context, 
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      ),
                      color: Colors.white
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6,
                                offset: Offset(0, 3)
                              )
                            ]
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {

                                              }, 
                                              child: Text(
                                                'Laporan Laba Rugi',
                                                style: TextStyle(
                                                  fontSize: 14
                                                ),
                                              )
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {

                                              }, 
                                              child: Text(
                                                'Laporan Posisi Keuangan',
                                                style: TextStyle(
                                                  fontSize: 14
                                                ),
                                              )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10), 
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.settings
                                    ),
                                    title: Text('Pengaturan'),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.logout
                                    ),
                                    title: Text('Logout'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              );
              */
            },
          ),

          /*
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => loginPage()),
                  (route) => false);
            }, child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )*/
        
        ],
        */
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _drawerHeader(),
            _drawerItem(
              icon: Icons.add_circle_outline_sharp,
              text: 'Tambah Anggota',
              onTap: () => print('Tap My Files')),
            Divider(height: 15, thickness: 1),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 5, bottom: 5),
              child: Text("Laporan",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
            _drawerItem(
              icon: Icons.bar_chart_outlined,
              text: 'Laba Rugi',
              onTap: () {}
            ),
            _drawerItem(
              icon: Icons.grain_rounded,
              text: 'Posisi Keuangan',
              onTap: () {}
              ),
            Divider(height: 15, thickness: 1),
            _drawerItem(
              icon: Icons.settings,
              text: 'Pengaturan',
              onTap: () {}
            ),
            _drawerItem(
              icon: Icons.logout,
              text: 'Keluar',
              onTap: () {
                Navigator. of( context ) .push ( MaterialPageRoute (
                  builder: ( BuildContext context ) => loginPage())
                );
              }
            ),
          ]
        ),
      ),

      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => tambahTransaksi()));
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      */

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
          padding: EdgeInsets.symmetric(horizontal: 30),
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
                  color: _selectedIndex == 0 ? Colors.black : Colors.white,
                ),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  selectedPage[1];
                  setState(() {
                    _selectedIndex = 1;
                    print('Halaman Nama Akun');
                  });
                }, 
                icon: Icon(
                  Icons.category_outlined,
                  color: _selectedIndex == 1 ? Colors.black : Colors.white,
                ),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  selectedPage[2];
                  setState(() {
                    _selectedIndex = 2;
                    print('Halaman Profil');
                  });
                }, 
                icon: Icon(
                  Icons.people_rounded,
                  color: _selectedIndex == 2 ? Colors.black : Colors.white,
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

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    accountName: Text('Belajar Flutter'),
    accountEmail: Text('test@gmail.com'),
  );
}

Widget _drawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
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