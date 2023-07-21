import 'package:bersihin_app/login.dart';
import 'package:bersihin_app/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bersihin App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key, required this.title});

  final String title;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  String? selectedType;
  int selectedPage = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const SizedBox(
              height: 56.0,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Lokasi Penjemputan',
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton(
              value: selectedType,
              hint: const Text("Pilih Paket Laundry"),
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: "Reguler",
                  child: Text("Reguler (Rp 6.000/kg)"),
                ),
                DropdownMenuItem(
                  value: "Express",
                  child: Text("Express (Rp 10.000/kg)"),
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  selectedType = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                  backgroundColor: Color(0xFF3282B8),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Order Laundry",
                  style: TextStyle(letterSpacing: 2),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Transaksi Berjalan",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Transaction(
              id: 100001,
              laundryType: "Reguler",
              status: "Menunggu Dijemput",
              weight: 3,
              price: "Rp 21.000",
              isFinished: false,
            ),
            const SizedBox(height: 10),
            const Transaction(
              id: 100001,
              laundryType: "Express",
              status: "Cucian Diproses",
              weight: 3,
              price: "Rp 32.000",
              isFinished: false,
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              "Riwayat Transaksi",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Transaction(
              id: 100000,
              laundryType: "Reguler",
              status: "Transaksi Selesai",
              weight: 5,
              price: "Rp 40.000",
              isFinished: true,
            ),
            SizedBox(height: 10),
            Transaction(
              id: 99999,
              laundryType: "Reguler",
              status: "Komplain Diproses",
              weight: 5,
              price: "Rp 40.000",
              isFinished: true,
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              "Nomor Handphone",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              "081224263669",
              style: TextStyle(fontSize: 16, color: Colors.black45),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.black),
            SizedBox(height: 10),
            Text(
              "Poin Terkumpul",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              "16.141",
              style: TextStyle(fontSize: 16, color: Colors.black45),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.black),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                style: ButtonStyle(
                    textStyle: MaterialStateTextStyle.resolveWith((states) =>
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.black45), // Change the text color here
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.all(0)), // Set padding to zero
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                child: Text("Keluar"),
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: Center(
        child: pages.elementAt(selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
