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
            SvgPicture.asset(
              'images/chees.svg',
              width: 300,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: 350,
                  child: ListView(
                    children: const [
                      CustomButton(name: 'DAILY REPORT'),
                      CustomButton(name: 'WEEKLY REPORT'),
                      CustomButton(name: 'ADD PRODUCT'),
                      CustomButton(name: 'ADD SUPPLIER'),
                      CustomButton(name: 'ALL SUPPLIERS'),
                      CustomButton(name: 'ALL PRODUCTS'),
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
}
