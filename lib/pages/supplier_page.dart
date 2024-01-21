import 'package:expiration_date/supplier_tile.dart';
import 'package:flutter/material.dart';

class SupplierPage extends StatelessWidget {
  const SupplierPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SupplierTile> suppliers = [
      SupplierTile(
        'qqqqqqqqqqqqqqqqqqqqqqqqqq',
        periodName: 'discount period',
      ),
      SupplierTile(
        'wwwwwwwwwwwwwww',
        periodName: 'discount period',
      ),
      SupplierTile(
        'eeeeeeeeeee',
        periodName: 'discount period',
      ),
      SupplierTile(
        'rrrrrrrrrrrrr',
        periodName: 'discount period',
      )
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('SUPPLIER'),
          backgroundColor: Colors.redAccent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(13),
              ),
              child: TabBar(
                tabs: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Tab(text: 'EXCHANGE'),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  Tab(text: 'WRITE-OFF'),
                  Tab(text: 'RETURN'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.separated(
              itemCount: suppliers.length,
              itemBuilder: (context, int index) {
                return suppliers[index];
              },
              separatorBuilder: (context, int index) {
                return Divider(
                  thickness: 5,
                  height: 30,
                  indent: 50,
                  endIndent: 50,
                );
              },
            ),
            ListView.separated(
              itemBuilder: (context, int index) {
                return suppliers[index];
              },
              separatorBuilder: (context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: suppliers.length,
            ),
            SupplierTile(
              'supp.lier',
              discountPeriod: 12,
              notifyingPeriod: 30,
              salle: 15,
              periodName: 'notification period',
            )
          ],
        ),
      ),
    );
  }
}
