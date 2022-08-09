import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  String address = "";
  String name = "";
  String gst = "";
  String organization = "";
  String phno = "";

  Customer(
      {required this.name,
      required this.address,
      required this.organization,
      required this.phno,
      required this.gst});

  factory Customer.fromMap(DocumentSnapshot data) {
    return Customer(
      address: data["address"],
      name: data["name"],
      gst: data["gst_number"],
      organization: data["organization"],
      phno: data["phone"],
    );
  }
}
