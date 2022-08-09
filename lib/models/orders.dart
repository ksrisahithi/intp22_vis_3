import 'package:cloud_firestore/cloud_firestore.dart';
import 'customer.dart';
import 'details.dart';

class Orders {
  late String id;
  late String des;
  late Customer customer;
  late Details dets;

  Orders(
      {required this.id,
      required this.des,
      required this.customer,
      required this.dets});

  factory Orders.fromMap(DocumentSnapshot data) {
    return Orders(
      id: data['id'],
      des: data["description"],
      customer: Customer.fromMap(data["customer"]),
      dets: Details.fromMap(data),
    );
  }
}
