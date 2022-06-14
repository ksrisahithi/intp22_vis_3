import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          // leading: AssetImage(assetName),
          title: const Text("Robotic Welding Cell: Supervisor"),
          backgroundColor: const Color.fromRGBO(51, 0, 64, 1),
        ),
      body: Column(
        children: [
          tabsection,
          upperLists,
        ],
      )
      ),
    );
  }
}

Container _buildTabButton(Color color, String label, bool active) {
  return Container(
    margin: const EdgeInsets.fromLTRB(2, 0, 0, 0),
    padding: const EdgeInsets.only(top: 6,bottom: 6,left: 18,right: 18),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      color: color,
    ),
    child: Center(child: Text(label),),
  );
}

Widget tabsection = Container(
  padding: const EdgeInsets.fromLTRB(18, 18, 18, 0) ,
  child: Row(
    children: [
      _buildTabButton(Colors.white, "Home", true),
      _buildTabButton(Colors.grey, "Purchase", false),
      _buildTabButton(Colors.grey, "Users", false),
      _buildTabButton(Colors.grey, "Messages", false),
    ],
  ),
);

Widget upperLists = Container(
  padding: const EdgeInsets.fromLTRB(18, 12, 18, 18) ,
  child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Text(
            'Pending Order List',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(width: 800, height: 200, color: Colors.purple[300],),
        ],
      ),
      const SizedBox(width: 16,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
          'Pings',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Container(width: 300, height: 200, color: Colors.purple[300],),
        ],
      ),
    ],
  ),
);

