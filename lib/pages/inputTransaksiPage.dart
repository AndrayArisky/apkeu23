import 'dart:convert';

import 'package:apkeu23/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class InputFormatterNominal extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("0,##", "pt_BR");
    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

class tambahTransaksi extends StatefulWidget {
  @override
  tambahTransaksiState createState() => tambahTransaksiState();
}

class tambahTransaksiState extends State<tambahTransaksi> {
  TextEditingController kategori = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController nominal = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  //text editing controller for text field

  void simpanTransaksi() async {
    var url = Uri.parse('http://apkeu2023.000webhostapp.com/input.php');
    var body = {
      'kategori': kategori.text,
      'tgl_transaksi': selectedDate.toString(),
      'nominal': nominal.text,
      'keterangan': keterangan.text,
      'status': status
    };

    var response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['message'] == 'Data berhasil disimpan') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Data berhasil disimpan"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Data Gagal di Simpan"),
              content:
                  Text("Pastikan data yang anda input Benar dan tidak Ganda"),
              // content: Text(result["message"]),
              actions: <Widget>[
                ElevatedButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      }
    }
  }

  int? selected = -1;
  int selectedIndex = 0;
  bool buttonStatus = true;
  late int type;
  String status = 'Pilih Status';
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  void onChanged(int? value) {
    setState(() {
      this.selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tambah Transaksi'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          selectedIndex == 0 ? Colors.green : Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                    child: Text(
                      "PEMASUKAN",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                        status = 'pemasukan';
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          selectedIndex == 1 ? Colors.red : Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                    child: Text(
                      "PENGELUARAN",
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                        status = 'pengeluaran';
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: kategori, //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.category_outlined), //icon of text field
                  labelText: "Kategori" //label text of field

                  ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: date, //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_month_sharp), //icon of text field
                  labelText: "Tanggal", //label text of field
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    date.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Tentukan tanggal transaksi!");
                }
                /*
              showDatePicker (
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101)
              ).then((value) {
                if (value != null) {
                  setState(() {
                    selectedDate = value;
                    print(selectedDate);
                  });
                } else {
                  print("Tentukan tanggal transaksi!");
                  print('');
                }
              });
              */
              },
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: nominal, //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.attach_money), //icon of text field
                  labelText: "Nominal", //label text of field
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                InputFormatterNominal()
              ],
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: keterangan, //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.edit_note_rounded), //icon of text field
                  labelText: "Keterangan", //label text of field
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
            ),

            /*
            SizedBox(
              height: 20.0
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: this.selected,
                  onChanged: (int? value) {
                    onChanged(value);
                  }
                ),
                Container(
                  width: 8.0,
                ),
                Text('Cash'),
                Radio(
                  value: 1,
                  groupValue: this.selected,
                  onChanged: (int? value) {
                    onChanged(value);
                  }
                ),
                Container(
                  width: 8.0,
                ),
                Text('Non-cash')
              ],
            ),
            */

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
                    /*
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return transaksi();
                    }));
                    */
                      simpanTransaksi();
                  },
                ),
              ))
            ]),
          ]),
        ));
  }
}
