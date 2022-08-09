// ignore_for_file: must_be_immutable

part of homepage;

class COrderDetails extends StatefulWidget {
  COrderDetails({Key? key, required this.data}) : super(key: key);

  QueryDocumentSnapshot data;

  @override
  State<COrderDetails> createState() => _COrderDetailsState();
}

class _COrderDetailsState extends State<COrderDetails> {
  Container objection({required String name, required int value}) {
    if (widget.data['flag'][name] != 0) {
      return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kSpacing, vertical: kSpacing / 2),
        decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            borderRadius: BorderRadius.circular(kBorderRadius)),
        child: const Center(
          child: Text('check'),
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 650) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kSpacing),
                child: DataTable(
                  horizontalMargin: 0,
                  columns: [
                    DataColumn(
                        label: Text(
                      'Name',
                      style: TextStyle(color: kFontColorPalette[2]),
                    )),
                    DataColumn(
                        label: Text(
                      'Parameter',
                      style: TextStyle(color: kFontColorPalette[2]),
                    )),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Material')),
                        DataCell(Text(widget.data['weldMaterial1'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Quantity')),
                        DataCell(Text(widget.data['quantity1'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Material')),
                        DataCell(Text(widget.data['weldMaterial2'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Quantity')),
                        DataCell(Text(widget.data['quantity2'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Pattern')),
                        DataCell(Text(widget.data['weldPattern'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Welding Mode')),
                        DataCell(Text(widget.data['weldingMode'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Joint')),
                        DataCell(Text(widget.data['weldJoint'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Pass')),
                        DataCell(Text(widget.data['weldPasses'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Material')),
                        DataCell(Text(widget.data['weldJobNumber'])),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kSpacing),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(kSpacing),
                      // margin:  const EdgeInsets.all(kSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Objections raised',
                              style: TextStyle(
                                  color: kFontColorPalette[2]),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kSpacing / 2),
                                  margin: const EdgeInsets.fromLTRB(
                                      0, 0, kSpacing, 0),
                                  child: const Text('Operator'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                objection(
                                    name: 'operator',
                                    value: widget.data['flag']['operator']),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kSpacing / 2),
                                  child: const Text('Shopkeeper'),
                                ),
                                objection(
                                    name: 'shopkeeper',
                                    value: widget.data['flag']['shopkeeper']),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kSpacing / 2),
                                  child: const Text('Quality Engineer'),
                                ),
                                objection(
                                    name: 'qualityengineer',
                                    value: widget.data['flag']
                                        ['qualityengineer']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Progress : '),
                    Text("${widget.data['progress'] * 100}%")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
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
                        width:
                            double.parse(widget.data['progress'].toString()) *
                                300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            color: kHeadColorPalette[0]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kSpacing),
                child: DataTable(
                  horizontalMargin: 0,
                  columns: [
                    DataColumn(
                        label: Text(
                      'Name',
                      style: TextStyle(color: kFontColorPalette[2]),
                    )),
                    DataColumn(
                        label: Text(
                      'Parameter',
                      style: TextStyle(color: kFontColorPalette[2]),
                    )),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Material')),
                        DataCell(Text(widget.data['weldMaterial1'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Quantity')),
                        DataCell(Text(widget.data['quantity1'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Material')),
                        DataCell(Text(widget.data['weldMaterial2'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Quantity')),
                        DataCell(Text(widget.data['quantity2'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Pattern')),
                        DataCell(Text(widget.data['weldPattern'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Welding Mode')),
                        DataCell(Text(widget.data['weldingMode'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Joint')),
                        DataCell(Text(widget.data['weldJoint'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Pass')),
                        DataCell(Text(widget.data['weldPasses'])),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Weld Material')),
                        DataCell(Text(widget.data['weldJobNumber'])),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(kSpacing),
                    // margin:  const EdgeInsets.all(kSpacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Objections raised',
                            style:
                                TextStyle(color: kFontColorPalette[2]),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kSpacing / 2),
                                margin: const EdgeInsets.fromLTRB(
                                    0, 0, kSpacing, 0),
                                child: const Text('Operator'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              objection(
                                  name: 'operator',
                                  value: widget.data['flag']['operator']),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kSpacing / 2),
                                child: const Text('Shopkeeper'),
                              ),
                              objection(
                                  name: 'shopkeeper',
                                  value: widget.data['flag']['shopkeeper']),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kSpacing / 2),
                                child: const Text('Quality Engineer'),
                              ),
                              objection(
                                  name: 'qualityengineer',
                                  value: widget.data['flag']
                                      ['qualityengineer']),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Progress : '),
                    Text("${widget.data['progress'] * 100}%")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
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
                        width:
                            double.parse(widget.data['progress'].toString()) *
                                300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            color: kHeadColorPalette[0]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }
    });
  }
}
