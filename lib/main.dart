import 'package:flutter/material.dart';
import 'package:bank_app/ui/account_and_card.dart';
import 'package:bank_app/ui/applications.dart';
import 'package:bank_app/ui/homePage.dart';
import 'package:bank_app/ui/my_status.dart';
import 'package:bank_app/ui/transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final List<String>? myStringList;

  const MyApp({Key? key, this.myStringList}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String>? transactionsList;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    transactionsList = widget.myStringList ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _sayfalar = [
      HomePage(myStringList: transactionsList,),
      AccountAndCard(),
      Applications(),
      Transactions(),
      My_Status(),
    ];

    void _butonaBasildi(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return MaterialApp(
      title: 'Bank Uygulaması',
      home: Scaffold(
        body: _sayfalar[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Ana Sayfa'),
            NavigationDestination(icon: Icon(Icons.credit_card), label: 'Hesap ve Kart'),
            NavigationDestination(icon: Icon(Icons.add_circle_outlined), label: 'Başvurular'),
            NavigationDestination(icon: Icon(Icons.align_horizontal_right, color: Colors.red), label: 'İşlemler'),
            NavigationDestination(icon: Icon(Icons.heart_broken), label: 'Durumum'),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: _butonaBasildi,
        ),
      ),
    );
  }
}
