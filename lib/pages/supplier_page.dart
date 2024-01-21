import 'package:flutter/material.dart';

class SupplierPage extends StatelessWidget {
  const SupplierPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> suppliers = [
      'SUPPLIER NAME 1',
      'SUPPLIER NAME 2',
      'SUPPLIER NAME 3',
      'SUPPLIER NAME 4',
      'SUPPLIER NAME 5'
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('SUPPLIER'),
          backgroundColor: Colors.redAccent,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'EXCHANGE',
              ),
              Tab(
                text: 'WRITE-OFF',
              ),
              Tab(
                text: 'RETURN',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: suppliers.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text(suppliers[index]),
                );
              },
            ),
            ListView.separated(
              itemCount: suppliers.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text(suppliers[index]),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'notyfieng period:',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.sell),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, int index) {
                return Divider(thickness: 13,);
              },
            ),
            ListView.builder(
              itemCount: suppliers.length,
              itemBuilder: (context, int index) {
                return Column(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('bottom')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('notyfieng period: '),
                        Text('salle: '),
                      ],
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
