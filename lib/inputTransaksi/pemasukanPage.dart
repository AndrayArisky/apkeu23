import 'dart:convert';

import 'package:apkeu23/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class pemasukanPage extends StatefulWidget {
  @override
  _pemasukanPageState createState() => _pemasukanPageState();
}

class _pemasukanPageState extends State<pemasukanPage> {

  late String _selectedItem;
  List<String> _dropdownItems = [];

  Future<List<String>> fetchData() async {
    final response = await http.get(Uri.parse('https://apkeu2023.000webhostapp.com/getdata.php'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<String> items = [];
      for (var item in data) {
        items.add(item['kode_akun']);
      }
      return items;
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((data) {
      setState(() {
        _dropdownItems = data;
      });
    });
  }

  TextEditingController date = TextEditingController();
  TextEditingController nominal = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[

//KATEGORI
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.category
                ),
                labelText: "Kategori", //label text of field
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0)
                  )
                )
              ),
            ),

            // TANGGAL INPUT
            SizedBox(height: 10.0),
            TextField(
            controller: date, //editing controller of this TextField
            decoration: InputDecoration(
              icon: Icon(
                Icons.calendar_today
              ), //icon of text field
              labelText: "Tanggal", //label text of field
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0)
                  )
                )
            ),
            readOnly: true, //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context, 
                initialDate: DateTime.now(), 
                firstDate: DateTime(2000), 
                lastDate: DateTime(2101)
              );
              if (pickedDate != null) {
                  print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
                  print(formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    date.text = formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Tentukan tanggal transaksi!");
                  date.text = '';
                }
            },
            ),

            // NOMINAL INPUT
            SizedBox(height: 10.0),
            TextField(
              controller: nominal, //editing controller of this TextField
              decoration: InputDecoration(
                icon: Icon(
                  Icons.attach_money
                ), //icon of text field
                labelText: "Nominal", //label text of field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0)
                  )
                )
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                InputFormatterNominal()
              ],
            ),

            // KETERANGAN INPUT
            SizedBox(height: 10.0),
            TextField(
              controller: keterangan, //editing controller of this TextField
              decoration: InputDecoration(
                icon: Icon(Icons.edit_note_rounded), //icon of text field
                labelText: "Keterangan", //label text of field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0)
                  )
                )
              ),
            ),

            // TOMBOL SIMPAN
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: Text(
                        "Simpan",
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context, MaterialPageRoute(
                            builder: (context) {
                              return transaksi();
                            }
                          )
                        );
                      },
                    ),
                  )
                )
              ]
            ),
          ],
        ),
        
      )
    );
  }
}

class InputFormatterNominal extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, TextEditingValue newValue) {
      if (newValue.selection.baseOffset == 0) {
        return newValue;
      }

      double value = double.parse(newValue.text);
      final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
      String newText = formatCurrency.format(value / 100);

      return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length)
      );
    }
}