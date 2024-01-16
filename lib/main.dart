import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_button.dart';

void main() {
  runApp(const StartPage());
}

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List<String> buttonNames = [
    'DAILY RAPORT',
    'WEEKLY RAPORT',
    'ADD PRODUCT',
    'ADD SUPLIER',
    'ALL SUPLIERS',
    'ALL PRODUCTS',
    '',
    '',
    '',
    'OTHER FIELDS',
    'OTHER FIELDS',
    'OTHER FIELDS',
    'OTHER FIELDS',
    'OTHER FIELDS',
    'OTHER FIELDS',
    'OTHER FIELDS',
    'OTHER FIELDS',

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          title: const Text(
            'OKWINE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SvgPicture.asset('images/chees.svg', width: 200),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: 350,
                  child: ListView.builder(
                    itemCount: buttonNames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CustomButton(name: buttonNames[index]),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
