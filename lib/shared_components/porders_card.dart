part of homepage;

class PendingOrdersCard extends StatefulWidget {
  const PendingOrdersCard({Key? key}) : super(key: key);

  @override
  State<PendingOrdersCard> createState() => _PendingOrdersCardState();
}

class _PendingOrdersCardState extends State<PendingOrdersCard> {
  final ScrollController _controller = ScrollController();
  final Stream<QuerySnapshot> _usersstream =
      FirebaseFirestore.instance.collection("penidngOrders").snapshots();

  List<Color> ColorPalette = [
    Color(0xff93e4c1),
    Color(0xff3baea0),
    Color(0xff118a7e),
    Color(0xff1f6f78),
    Color(0xff7B7009),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxHeight: 200),
        padding: const EdgeInsets.only(bottom: kSpacing, top: kSpacing / 2),
        child: StreamBuilder<QuerySnapshot>(
            stream: _usersstream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('There is something wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading');
              }
              return Scrollbar(
                controller: _controller,
                child: ListView.separated(
                  shrinkWrap: true,
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, _) => const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (context, index) => Container(
                    height: 100,
                    width: 200,
                    padding: const EdgeInsets.all(kSpacing / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        color: index%2 == 0 ? ColorPalette[index%4 == 0 ? 1 : 2] : ColorPalette[3]
                        ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/porderspage', arguments: [
                          snapshot.data!.docs[index],
                          snapshot.data!.docs[index].reference
                        ]);
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            // margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              // color: Theme.of(context).primaryColorLight.withOpacity(0.3)
                            ),
                            child: Text(
                              snapshot.data!.docs[index]['id'],
                              style: TextStyle(
                                color: kFontColorPalette[2],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            // padding: const EdgeInsets.symmetric(horizontal: 8),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                            ),
                            child: Text(
                              snapshot.data!.docs[index]['description'],
                              style: TextStyle(
                                  color: kFontColorPalette[3],
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: .8),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    // padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      'Not Approved: ',
                                      style: TextStyle(
                                        color: kFontColorPalette[3],
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: (flagcount('flag1',
                                                  snapshot.data!.docs[index]) !=
                                              0
                                          ? kFlagColor[0]
                                          : Theme.of(context).cardColor),
                                    ),
                                    child: Center(
                                      child: Text(
                                        flagcount('flag1',
                                                snapshot.data!.docs[index])
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    child: Text(
                                      'For Approval: ',
                                      style: TextStyle(
                                        color: kFontColorPalette[3],
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: (flagcount('flag2',
                                                  snapshot.data!.docs[index]) !=
                                              0
                                          ? kFlagColor[1]
                                          : Theme.of(context).cardColor),
                                    ),
                                    child: Center(
                                      child: Text(
                                        flagcount('flag2',
                                                snapshot.data!.docs[index])
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

int flagcount(String flag, orderData) {
  int result = 0;
  orderData["weldMaterial1"][flag] ? null : result++;
  orderData["quantity1"][flag] ? null : result++;
  orderData["weldMaterial2"][flag] ? null : result++;
  orderData["quantity2"][flag] ? null : result++;
  orderData["weldPattern"][flag] ? null : result++;
  orderData["weldingMode"][flag] ? null : result++;
  orderData["weldJoint"][flag] ? null : result++;
  orderData["weldPasses"][flag] ? null : result++;
  orderData["weldJobNumber"][flag] ? null : result++;

  return result;
}
