import 'package:apkeu23/loginPage.dart';
import 'package:flutter/material.dart';

class registerPage extends StatefulWidget {
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {

  bool _isHidePassword = true;

  void _togglePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }
  
  TextEditingController nama = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController nohp = new TextEditingController();
  TextEditingController nm_usaha = new TextEditingController();
  TextEditingController password1 = new TextEditingController();
  TextEditingController passsword2 = new TextEditingController();
  
  Widget _buildPageContent () {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50,),
            SizedBox(
              child: Center(
                child: Text(
                  'APKEU - UMKM',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,    
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            ListTile(
              title: TextField(
                style: TextStyle(
                  color: Colors.blue
                ),
                controller: nama,
                decoration: InputDecoration(
                  hintText: 'Nama Pemilik',
                  hintStyle: TextStyle(
                    color: Colors.blue
                  ),
                ),
              ),
            ),
             SizedBox(height: 30,),
            ListTile(
              title: TextField(
                style: TextStyle(
                  color: Colors.blue
                ),
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.blue
                  ),
                ),
              ),
            ),
             SizedBox(height: 30,),
            ListTile(
              title: TextField(
                style: TextStyle(
                  color: Colors.blue
                ),
                controller: nohp,
                decoration: InputDecoration(
                  hintText: 'No. HP / Telepon',
                  hintStyle: TextStyle(
                    color: Colors.blue
                  ),
                ),
              ),
            ),
             SizedBox(height: 30,),
            ListTile(
              title: TextField(
                style: TextStyle(
                  color: Colors.blue
                ),
                controller: nm_usaha,
                decoration: InputDecoration(
                  hintText: 'Nama Usaha',
                  hintStyle: TextStyle(
                    color: Colors.blue
                  ),
                ),
              ),
            ),
             SizedBox(height: 30,),
            ListTile(
              title: TextField(
                style: TextStyle(
                  color: Colors.blue
                ),
                controller: password1,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.blue
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _togglePassword();
                    },
                    child: Icon(
                      _isHidePassword                          ? Icons.visibility_off
                      : Icons.visibility,
                      color: _isHidePassword ? Colors.grey : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(height: 30,),
            ListTile(
              title: TextField(
                style: TextStyle(
                  color: Colors.blue
                ),
                controller: nama,
                decoration: InputDecoration(
                  hintText: 'Konfirmasi Ulang Passsword',
                  hintStyle: TextStyle(
                    color: Colors.blue
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _togglePassword();
                    },
                    child: Icon(
                      _isHidePassword                          ? Icons.visibility_off
                      : Icons.visibility,
                      color: _isHidePassword ? Colors.grey : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                      ),
                      child: Text('Daftar'),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context, MaterialPageRoute(
                            builder: (context) {
                              return loginPage();
                            }
                          )
                        );
                      }, 
                    ),
                  )
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sudah punya akun?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(
                        builder: (context) {
                          return loginPage();
                        }
                      )
                    );
                  }, 
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                  ),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(),
    );
  }
}
