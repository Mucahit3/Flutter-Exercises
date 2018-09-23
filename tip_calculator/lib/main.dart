//
//  main.dart
//
//  Created by Muhammet Mucahit Aktepe on 5.09.2018.
//  Copyright © 2018 Muhammet Mucahit Aktepe. All rights reserved.
//

import 'package:flutter/material.dart';

const APP_NAME = "Tip Calculator";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final billController = TextEditingController();
  final tipController = TextEditingController();

  bool validationErrorBill = false;
  bool validationErrorTip = false;

  double tip;
  double bill;

  String alertDialog;
  String title;

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    billController.dispose();
    tipController.dispose();
    super.dispose();
  }

  onPressedCalculateButton() {
    double total = bill + (bill / 100.0 * tip);
    
    if(tip == -1.0 || bill == -1.0) {
      title = "WARNING";
      alertDialog = "Please fill the text fields properly...";
    }
    else {
      title = "RESULT";
      alertDialog = "Tip: \$$tip\nTotal: \$$total";
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(alertDialog),
        );
      },
    );

    billController.clear();
    tipController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                onChanged: (str) {
                  setState(() {
                    if (billController.text != null ||
                        billController.text != "") {
                      try {
                        bill = double.parse(billController.text);
                        validationErrorBill = false;
                      } catch (e) {
                        bill = -1.0;
                        validationErrorBill = true;
                      }
                    }
                  });
                },
                keyboardType: TextInputType.number,
                controller: billController,
                decoration: InputDecoration(
                  errorText: validationErrorBill
                      ? 'Please enter a correct value!'
                      : null,
                  labelText: "Bill amount(\$)",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                onChanged: (str) {
                  setState(() {
                    if (tipController.text != null ||
                        tipController.text != "") {
                      try {
                        tip = double.parse(tipController.text);
                        validationErrorTip = false;
                      } catch (e) {
                        tip = -1.0;
                        validationErrorTip = true;
                      }
                    }
                  });
                },
                keyboardType: TextInputType.number,
                controller: tipController,
                decoration: InputDecoration(
                  errorText: validationErrorTip
                      ? 'Please enter a correct value!'
                      : null,
                  labelText: "Tip %",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: onPressedCalculateButton,
              child: Text("Calculate"),
            ),
          ],
        ),
      ),
    );
  }
}
