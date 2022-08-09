// ignore_for_file: non_constant_identifier_names

part of homepage;

class COrdersCard extends StatefulWidget {
  const COrdersCard({Key? key}) : super(key: key);

  @override
  State<COrdersCard> createState() => _COrdersCardState();
}

class _COrdersCardState extends State<COrdersCard> {
  final Stream<QuerySnapshot> _usersstream =
      FirebaseFirestore.instance.collection("confirmedOrders").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersstream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("There is an error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
        }
        return LayoutBuilder(
          builder: ((context, constriants) {
            if (constriants.maxWidth < 650) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Confirmed Orders',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: kFontColorPalette[0],
                            letterSpacing: .8),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text('See More'))
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Column(
                    children: List.generate(
                      4,
                      (index) => Container(
                        padding: const EdgeInsets.all(kSpacing / 2),
                        margin: const EdgeInsets.symmetric(vertical: kSpacing),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            color: Theme.of(context).cardColor),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/corderspage',
                                arguments: [snapshot.data!.docs[index]]);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "ID ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
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
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Description ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600),
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
                                          color: kFontColorPalette[1],
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          letterSpacing: .8),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: const Text(
                                  "Progress",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                height: 24,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius),
                                    color: kFontColorPalette[0]),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 24,
                                      width: double.parse(snapshot
                                              .data!.docs[index]['progress']
                                              .toString()) *
                                          300,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              kBorderRadius),
                                          color: kHeadColorPalette[0]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius)),
                child: Padding(
                  padding: const EdgeInsets.all(kSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Confirmed Orders',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: kFontColorPalette[0],
                                letterSpacing: .8),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          horizontalMargin: 0,
                          columns: const [
                            DataColumn(
                              label: Text(
                                "ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                             DataColumn(
                                label: Text(
                              "Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600),
                            )),
                            DataColumn(
                                label: Text(
                              "Progress",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600),
                            )),
                          ],
                          rows: List.generate(
                              snapshot.data!.docs.length,
                              (index) => _COrderRowData(
                                  snapshot.data!.docs[index], context)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        );
      },
    );
  }

  DataRow _COrderRowData(data, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
            SizedBox(
              width: 100,
              child: Text(
                data['id'].toString(),
                style: TextStyle(color: kFontColorPalette[2]),
              ),
            ), onTap: () {
          Get.toNamed('/corderspage', arguments: [data]);
        }),
        DataCell(Text(
          data['description'].toString(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: kFontColorPalette[1]),
        )),
        DataCell(
          Container(
            height: 24,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: kFontColorPalette[0]),
            child: Stack(
              children: [
                Container(
                  height: 24,
                  width: double.parse(data['progress'].toString()) * 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: kHeadColorPalette[0]),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
