import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  TextEditingController dollarController = TextEditingController();
  String text = '';
  bool check = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Send Money'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 5),
            SizedBox(
              height: 45,
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter receiver phone number',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 45,
              width: 250,
              child: TextField(
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the \$ amount to send',
                ),
                keyboardType: TextInputType.number,
                controller: dollarController,
              ),
            ),
            Row(
              children: [
                SizedBox(width: 100,),
              Text('Apply deduction'),
              Checkbox(
                value: check,
                onChanged: (bool? value) {
                  setState(() {
                    check = value as bool;
                  });
                },
              ),
            ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  try {
                    int dollar = int.parse(dollarController.text);
                    if (check) {
                      if (dollar >= 100) {
                        dollar -= 2;
                      } else {
                        dollar -= 1;
                      }
                    }

                    text = "Received amount:${dollar.toStringAsFixed(0)} \$";
                  } catch (e) {
                    text = "Amount should be numbers";
                  }
                });
              },
              child: Icon(Icons.offline_pin_rounded),
            ),
            SizedBox(height: 5),
            Text('$text')
          ],
        ),
      ),
    );
  }
}
