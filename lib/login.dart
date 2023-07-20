import 'package:bersihin_app/main.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Masukkan Nomor Handphone Anda',
                style: TextStyle(
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.number,
              autofocus: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                fillColor: Color(0xFFC4C4C4),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                ),
              ),
            ),
            SizedBox(height: 14.0),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF3282B8)),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTP(),
                  ),
                );
              },
              child: Text(
                'KONFIRMASI',
                style: TextStyle(
                  letterSpacing: 4.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Masukkan Kode OTP',
                style: TextStyle(
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.number,
              autofocus: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                fillColor: Color(0xFFC4C4C4),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                ),
              ),
            ),
            SizedBox(height: 14.0),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF3282B8)),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(title: "Bersihin App"),
                  ),
                );
              },
              child: Text(
                'MASUK',
                style: TextStyle(
                  letterSpacing: 4.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
