import 'package:bank_app/ui/transfer.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          Icon(Icons.search, color: Colors.white,),
        ],
        title: const Text(
          "İşlemler",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(child: ListView(children: [
     GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Transfer(),));
      },
      child: ListTile(leading: Icon(Icons.add),title: Text("Para Transferleri (Tıklanabilir)",style: TextStyle(color: Colors.red.shade800),),),),
     ListTile(leading: Icon(Icons.add),title: Text("Ödemeler"),),
     ListTile(leading: Icon(Icons.add),title: Text("Ödeme iste"),),
     ListTile(leading: Icon(Icons.add),title: Text("Döviz ve altın işlemleri"),),
     ListTile(leading: Icon(Icons.add),title: Text("Yatırımlar"),),
     ListTile(leading: Icon(Icons.add),title: Text("Başvurular"),),
     ListTile(leading: Icon(Icons.add),title: Text("QR işlemler"),),
     ListTile(leading: Icon(Icons.add),title: Text("Akıllı işlemler"),)

    ],))); 
  }
}