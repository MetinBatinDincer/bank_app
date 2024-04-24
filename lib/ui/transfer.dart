import 'package:bank_app/ui/iban_transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          Icon(Icons.search, color: Colors.white,),
        ],
        title: const Text(
          "Para Transferleri",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(child: ListView(children: [
     Card(child: ListTile(title: Text("Kayıtlı Kişiye Transfer"),trailing: Icon(Icons.arrow_forward),),),
     GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Iban_Transfer(),));
      },
      child: Card(child: ListTile(title: Text("IBAN'a Transfer (Tıklanabilir)",style: TextStyle(color: Colors.red.shade800),),trailing: Icon(Icons.arrow_forward),),),),
     Card(child: ListTile(title: Text("Hesap No'ya Transfer"),trailing: Icon(Icons.arrow_forward),),),
     Card(child: ListTile(title: Text("Kendi Hesabıma Transfer"),trailing: Icon(Icons.arrow_forward),),),
     Card(child: ListTile(title: Text("Kolay Adrese Transfer"),trailing: Icon(Icons.arrow_forward),),),
     Card(child: Center(child: Container(height: 20,child: Text("Daha Fazla Göster"),)))

    ],)),
    
    );
  }
}