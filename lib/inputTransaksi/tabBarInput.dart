import 'package:apkeu23/inputTransaksi/pemasukanPage.dart';
import 'package:apkeu23/inputTransaksi/pengeluaranPage.dart';
import 'package:flutter/material.dart';

class tabBarPage extends StatefulWidget {
  
  @override
  _tabBarPageState createState() => _tabBarPageState();
}

class _tabBarPageState extends State<tabBarPage> with SingleTickerProviderStateMixin {
  late TabController tabController;


  @override
  void initState() {
    tabController = TabController(
      length: 2, 
      vsync: this,
    );
    super.initState();
  }
  

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catat Transaksi'
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  // height: 50,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TabBar(
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.black,
                          indicatorColor: Colors.white,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          controller: tabController,
                          tabs: [
                            Tab(
                              text: 'PEMASUKAN',
                            ),
                            Tab(
                              text: 'PENGELUARAN',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      pemasukanPage(),
                      pengeluaranPage(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}