import 'package:cloud_firestore/cloud_firestore.dart';

class Details {
  Map wm1 = {},
      wm2 = {},
      q1 = {},
      q2 = {},
      wp = {},
      wj = {},
      wpt = {},
      wm = {},
      wpo = {},
      wjn = {};
  Details(
      {required this.wm1,
      required this.q1,
      required this.wm2,
      required this.q2,
      required this.wpt,
      required this.wm,
      required this.wj,
      required this.wpo,
      required this.wp,
      required this.wjn});

  factory Details.fromMap(DocumentSnapshot data) {


    return Details(
      wm1: data["weldMaterial1"],
      wm2: data["weldMaterial2"],
      q1: data["quantity1"],
      q2: data["quantity2"],
      wpt: data["weldPattern"],
      wm: data["weldingMode"],
      wj: data["weldJoint"],
      wpo: data["weldPoint"],
      wp: data["weldPasses"],
      wjn: data["weldJobNumber"],
    );
  }
}
