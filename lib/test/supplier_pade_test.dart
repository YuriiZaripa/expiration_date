import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupplierPageTest extends StatelessWidget {
  const SupplierPageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [Text('tab1'), Text('tab2')],
          ),
        ),
        body: TabBarView(
          children: [
            Container(color: Colors.green),
            Container(color: Colors.red)
          ],
        ),
      ),
    );
  }
}
