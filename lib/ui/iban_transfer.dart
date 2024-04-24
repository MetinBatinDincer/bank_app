import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Eklemeyi unutmayın
import 'package:bank_app/main.dart';

class Iban_Transfer extends StatefulWidget {
  Iban_Transfer({super.key});

  @override
  State<Iban_Transfer> createState() => _Iban_TransferState();
}

class _Iban_TransferState extends State<Iban_Transfer> {
  TextEditingController senderController = TextEditingController();
  TextEditingController ibanController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<String> receipt = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          Icon(Icons.search, color: Colors.white,),
        ],
        title: const Text(
          "IBAN'a Transfer",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            textField("Gönderen", senderController),
            textField("IBAN", ibanController),
            textField("Tutar", amountController, isAmountField: true), // amountController için isAmountField true olarak ayarlandı
            textField("Açıklama", descriptionController),
            ElevatedButton(
              onPressed: () {
                String sender = senderController.text;
                String iban = ibanController.text;
                String amount = amountController.text;
                String description = descriptionController.text;

                if(sender.isNotEmpty && iban.isNotEmpty && amount.isNotEmpty && description.isNotEmpty) {
                  receipt.add(sender);
                  receipt.add(iban);
                  receipt.add(amount);
                  receipt.add(description);

                  print("Gönderen: $sender");

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp(myStringList: receipt),),
                  );
                } else {
                  // Burada kullanıcıya gerekli alanların doldurulması gerektiğine dair bir uyarı verebilirsin.
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Eksik Bilgi"),
                        content: Text("Lütfen tüm alanları doldurun."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Tamam"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10), // Padding değerlerini ekleyelim
                child: SizedBox(
                  child: Text("Gönder"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding textField(String write, TextEditingController controller, {bool isAmountField = false}) { // isAmountField parametresi eklendi
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5), // BorderRadius belirtelim
        ),
        child: TextField(
          controller: controller,
          keyboardType: isAmountField ? TextInputType.number : TextInputType.text, // isAmountField'e göre klavye türü belirlendi
          inputFormatters: isAmountField ? [FilteringTextInputFormatter.digitsOnly] : null, // isAmountField'e göre input formatter belirlendi
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: write,
          ),
        ),
      ),
    );
  }
}
