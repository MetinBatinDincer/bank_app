import 'package:flutter/material.dart';
import 'package:bank_app/ui/send_money.dart';

class HomePage extends StatefulWidget {
  final List<String>? myStringList;
  int balance = 5000;

  HomePage({Key? key, this.myStringList}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String>? transactionsList;

  @override
  void initState() {
    super.initState();
    if (widget.myStringList != null) {
      transactionsList = List.from(widget.myStringList!);
      if (transactionsList!.length > 2) {
        // transactionsList'in uzunluğunu kontrol ediyoruz
        setState(() {
          widget.balance = widget.balance - int.parse(transactionsList![2]);
        });
      } else {
        // Hata işleme mekanizması burada uygulanabilir
        print("transactionsList listesi eksik veri içeriyor.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Icon(Icons.circle),
            Icon(Icons.search),
          ],
        ),
        actions: [
          Text("UGİ"),
          Icon(Icons.notifications_active),
        ],
        backgroundColor: Colors.green,
        toolbarHeight: 200,
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("1285 - 010222 / Maltepe",
                                  style: TextStyle(fontSize: 18)),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_horiz),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          Text("Kullanılabilir Bakiye",
                              style: TextStyle(fontSize: 16)),
                          Text(
                            "${widget.balance.toString()} TL",
                            style: TextStyle(fontSize: 32),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Hesap Detaylarına Git >",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.cyan),
                            ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SendMoney(),
                                      ),
                                    ).then((value) {
                                      // SendMoney sayfasından dönen veriyi al
                                      setState(() {
                                        transactionsList = value
                                                as List<String>? ??
                                            transactionsList; // Eğer gelen değer null ise transactions değerini koru
                                      });
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add_card_sharp,
                                    color: Colors.cyan,
                                  ),
                                ),
                                Text("hızli Limit Öğren"),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.receipt,
                                    color: Colors.cyan,
                                  ),
                                ),
                                Text("Fatura Öde"),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.qr_code,
                                    color: Colors.cyan,
                                  ),
                                ),
                                Text("QR İşlemleri"),
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey.shade300,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (transactionsList != null &&
                                transactionsList!.isNotEmpty)
                              Column(children: [Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                      "Gönderen: ${transactionsList![0].toString()}, Tutar: ${transactionsList![2].toString()}"),
                                      
                                ],
                              ),
                              Text(
                                      "Iban: ${transactionsList![1].toString()}"),
                                      Text(
                                      "Açıklama: ${transactionsList![3].toString()}"),
                              ],),
                            if (transactionsList == null)
                              Column(
                                children: transactionsList!
                                    .map((transaction) => Text(transaction))
                                    .toList(),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
}