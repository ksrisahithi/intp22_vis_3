import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // var pendingOrdersEles = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          // leading: Image.asset("assets/images/fsmlogo.jpg", height: 68, width: 192,),
          title: const Center(child: Text("Robotic Welding Cell: Supervisor", style: TextStyle(fontSize: 28),)),
          backgroundColor: const Color.fromRGBO(51, 0, 64, 1),
        ),
      body: ListView(
        children: [
          tabsection,
          upperLists,
          lowerLists,
        ],
      )
      ),
    );
  }
}

Container _buildTabButton(Color color, String label, bool active) {
  return Container(
    margin: const EdgeInsets.fromLTRB(2, 0, 0, 0),
    padding: const EdgeInsets.only(top: 6,bottom: 6,left: 60,right: 60),
    decoration: BoxDecoration(
      // border: Border.all(color: Colors.grey),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      color: color,
    ),
    child: Center(child: Text(label, style: TextStyle(fontSize: 20),),),
  );
}

Widget tabsection = Container(
  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
  padding: const EdgeInsets.fromLTRB(18, 18, 18, 0) ,
  child: Row(
    children: [
      _buildTabButton(Colors.white, "Home", true),
      _buildTabButton(Colors.grey.shade300 , "Purchase", false),
      _buildTabButton(Colors.grey.shade300, "Users", false),
      _buildTabButton(Colors.grey.shade300, "Messages", false),
    ],
  ),
);

Widget upperLists = Container(
  decoration: BoxDecoration(
    border: Border(left: BorderSide(color: Colors.grey), right: BorderSide(color: Colors.grey), top: BorderSide(color: Colors.grey)) 
  ),
  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  padding: const EdgeInsets.fromLTRB(18, 12, 18, 18) ,
  child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: const Text(
              'New & Pending Orders',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 1039, 
            height: 290,
            color: Colors.purple[300],
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      height: 32,
                      width: 226,
                      child: const Text('Order ID',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      height: 32,
                      width: 553,
                      child: const Text('Description',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      height: 32,
                      width: 92,
                      child: const Text('flag1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      height: 32,
                      width: 92,
                      child: const Text('flag2',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children:
                    pendingDeatils(),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
      const SizedBox(width: 16,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
              child: const Text(
          'Pings',
          style: TextStyle(
              fontSize: 20,
          ),
        ),
            ),
        Container(
          width: 328, 
          height: 290, 
          color: Colors.purple[300],
          child: ListView(
            shrinkWrap: true,
            children: 
              pingDetails(),
          ),
          ),
        ],
      ),
    ],
  ),
);

Widget lowerLists = Container(
    decoration: BoxDecoration(
    border: Border(left: BorderSide(color: Colors.grey), right: BorderSide(color: Colors.grey), bottom: BorderSide(color: Colors.grey)) 
  ),
  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0) ,
  padding: const EdgeInsets.fromLTRB(18, 12, 18, 18) ,
  child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: const Text(
              'Confirmed Orders',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 1385, 
            height: 290,
            color: Colors.purple[300],
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      height: 32,
                      width: 226,
                      child: const Text('Order ID',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      height: 32,
                      width: 553,
                      child: const Text('Description',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children:
                    confirmedDeatils(),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    ],
  ),
);

Row pendingOrders(orderData) {
  String id = orderData["id"];
  String des = orderData["description"];
  int flag1 = orderData["flag1"], flag2 = orderData["flag2"];
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.fromLTRB(8, 4, 4, 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        height: 32,
        width: 226,
        child: Text(id),
      ),
      Container(
        height: 32,
        width: 553,
        margin: const EdgeInsets.fromLTRB(0, 4, 4, 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Text(des),
      ),
      Container(
        height: 32,
        width: 92,
        margin: const EdgeInsets.fromLTRB(0, 4, 4, 4),
        padding: const EdgeInsets.fromLTRB(0, 4, 8, 4),
        decoration: BoxDecoration(
          color: flag1 != 0 ? Colors.red.withOpacity(0.8) : Colors.grey,
          borderRadius: BorderRadius.circular(12)
        ),
        alignment: Alignment.centerRight,
        child: flag1 > 0 ? flag(flag1) : null,
      ),
      Container(
        height: 32,
        width: 92,
        margin: const EdgeInsets.fromLTRB(0, 4, 4, 4),
        padding: const EdgeInsets.fromLTRB(0, 4, 8, 4),
        decoration: BoxDecoration(
          color: flag2 != 0 ? Colors.red.withOpacity(0.8) : Colors.grey,
          borderRadius: BorderRadius.circular(12)
        ),
        alignment: Alignment.centerRight,
        child: flag2 > 0 ? flag(flag2) : null,
      ),
    ],
  );
}

List<Widget> pendingDeatils() {
  var x = <Widget>[];
  for(var i = 0; i < pendingOrdersData.length; i++) {
    x.add(pendingOrders(pendingOrdersData[i]));
  }
  return x;
}

Row confirmedOrders(orderData) {
  String id = orderData["id"];
  String des = orderData["description"];
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.fromLTRB(8, 4, 4, 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        height: 32,
        width: 226,
        child: Text(id),
      ),
      Container(
        height: 32,
        width: 553,
        margin: const EdgeInsets.fromLTRB(0, 4, 4, 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Text(des),
      ),
    ],
  );
}

List<Widget> confirmedDeatils() {
  var x = <Widget>[];
  for(var i = 0; i < pendingOrdersData.length; i++) {
    x.add(confirmedOrders(pendingOrdersData[i]));
  }
  return x;
}

Container flag(int flag) {
  return Container(
            width: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Text(flag.toString(),
              style: const TextStyle(color: Colors.black,
              ),
            ),
          );
}

Row Pings(Data) {
  String user = Data["user"];
  int flag = Data["flag"];
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        margin: const EdgeInsets.fromLTRB(8, 4, 4, 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        height: 32,
        width: 292,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(user, overflow: TextOverflow.ellipsis,),
            Container(
              height: 24,
              width: 24,
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
              decoration: BoxDecoration(
                color: Colors.purple[300],
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text(flag.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

List<Widget> pingDetails() {
  var x = <Widget>[];
  for(var i = 0; i < pings.length; i++) {
    x.add(Pings(pings[i]));
  }
  return x;
}