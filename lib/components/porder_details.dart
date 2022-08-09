// ignore_for_file: must_be_immutable, non_constant_identifier_names

part of homepage;

class POrderDetails extends StatefulWidget {
  POrderDetails({Key? key, required this.data, required this.reference})
      : super(key: key);

  QueryDocumentSnapshot data;
  DocumentReference reference;

  @override
  State<POrderDetails> createState() => _POrderDetailsState();
}

class _POrderDetailsState extends State<POrderDetails> {
  late List<String> dropdownvalues;
  late List flagvalues;
  late List<String> status;

  String approve(bool flag1, bool flag2) {
    String res = 'Pending';
    if (flag1 & flag2) {
      res = 'Approved';
    }
    return res;
  }

  void update(
      {required String key1, required String key2, required newValue}) async {
    await widget.reference.update({"$key1.$key2": newValue});
  }

  @override
  void initState() {
    super.initState();
    dropdownvalues = [
      widget.data['weldMaterial1']['des'],
      widget.data['quantity1']['des'],
      widget.data['weldMaterial2']['des'],
      widget.data['quantity2']['des'],
      widget.data['weldPattern']['des'],
      widget.data['weldingMode']['des'],
      widget.data['weldJoint']['des'],
      widget.data['weldPasses']['des'],
      widget.data['weldJobNumber']['des'],
    ];
    flagvalues = [
      widget.data['weldMaterial1']['flag2'],
      widget.data['quantity1']['flag2'],
      widget.data['weldMaterial2']['flag2'],
      widget.data['quantity2']['flag2'],
      widget.data['weldPattern']['flag2'],
      widget.data['weldingMode']['flag2'],
      widget.data['weldJoint']['flag2'],
      widget.data['weldPasses']['flag2'],
      widget.data['weldJobNumber']['flag2'],
    ];
    status = [
      approve(widget.data['weldMaterial1']['flag1'],
          widget.data['weldMaterial1']['flag2']),
      approve(
          widget.data['quantity1']['flag1'], widget.data['quantity1']['flag2']),
      approve(widget.data['weldMaterial2']['flag1'],
          widget.data['weldMaterial2']['flag2']),
      approve(
          widget.data['quantity2']['flag1'], widget.data['quantity2']['flag2']),
      approve(widget.data['weldPattern']['flag1'],
          widget.data['weldPattern']['flag2']),
      approve(widget.data['weldingMode']['flag1'],
          widget.data['weldingMode']['flag2']),
      approve(
          widget.data['weldJoint']['flag1'], widget.data['weldJoint']['flag2']),
      approve(widget.data['weldPasses']['flag1'],
          widget.data['weldPasses']['flag2']),
      approve(widget.data['weldJobNumber']['flag1'],
          widget.data['weldJobNumber']['flag2']),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)),
        child: Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: DataTable(
            horizontalMargin: 0,
            columns: [
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(color: kFontColorPalette[2]),
                  softWrap: true,
                ),
              ),
              DataColumn(
                label: Text(
                  'Parameter',
                  style: TextStyle(color: kFontColorPalette[2]),
                  softWrap: true,
                ),
              ),
              DataColumn(
                label: Text(
                  'Approved by Design Engineer',
                  style: TextStyle(color: kFontColorPalette[2]),
                  softWrap: true,
                ),
              ),
              DataColumn(
                label: Text(
                  'Ask Design Engineer',
                  style: TextStyle(color: kFontColorPalette[2]),
                  softWrap: true,
                ),
              ),
              DataColumn(
                label: Text(
                  'Approved',
                  style: TextStyle(color: kFontColorPalette[2]),
                  softWrap: true,
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  const DataCell(
                    Text("Weld Material"),
                  ),
                  DataCell(
                    // widget.data['weldMaterial1']['des'].toString()
                    DropdownButton(
                        value: dropdownvalues[0],
                        items: weldMaterial.map((String weldMaterial) {
                          return DropdownMenuItem(
                            value: weldMaterial,
                            child: Text(weldMaterial),
                          );
                        }).toList(),
                        onChanged: (String? NewValue) {
                          setState(() {
                            update(
                                key1: 'weldMaterial1',
                                key2: 'des',
                                newValue: NewValue);
                            dropdownvalues[0] = NewValue!;
                          });
                        }),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {});
                        },
                        value: widget.data['weldMaterial1']['flag1'],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            update(
                                key1: 'weldMaterial1',
                                key2: 'flag2',
                                newValue: value);
                            flagvalues[0] = value;
                            status[0] = approve(
                                widget.data['weldMaterial1']['flag1'],
                                flagvalues[0]);
                          });
                        },
                        value: flagvalues[0],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      status[0],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(Text('Quantity')),
                  DataCell(
                    TextField(
                      controller: TextEditingController()
                        ..text = dropdownvalues[1],
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$'))
                      ],
                      onChanged: (String value) {
                        update(key1: 'quantity1', key2: 'des', newValue: value);
                        dropdownvalues[1] = value;
                      },
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {});
                        },
                        value: widget.data['quantity1']['flag1'],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            update(
                                key1: 'quantity1',
                                key2: 'flag2',
                                newValue: value);
                            flagvalues[1] = value;
                            status[1] = approve(
                                widget.data['quantity1']['flag1'],
                                flagvalues[1]);
                          });
                        },
                        value: flagvalues[1],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(Text(status[1])),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text("Weld Material"),
                  ),
                  DataCell(
                    DropdownButton(
                        value: dropdownvalues[2],
                        items: weldMaterial.map((String weldMaterial) {
                          return DropdownMenuItem(
                            value: weldMaterial,
                            child: Text(weldMaterial),
                          );
                        }).toList(),
                        onChanged: (String? NewValue) {
                          setState(() {
                            update(
                                key1: 'weldMaterial2',
                                key2: 'des',
                                newValue: NewValue);
                            dropdownvalues[2] = NewValue!;
                          });
                        }),
                  ),
                  DataCell(
                    Center(
                        child: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {});
                      },
                      value: widget.data['weldMaterial2']['flag1'],
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.deepPurpleAccent),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    )),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            update(
                                key1: 'weldMaterial2',
                                key2: 'flag2',
                                newValue: value);
                            flagvalues[2] = value;
                            status[2] = approve(
                                widget.data['weldMaterial2']['flag1'],
                                flagvalues[2]);
                          });
                        },
                        value: flagvalues[2],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(Text(status[2])),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(Text('Quantity')),
                  DataCell(
                    TextField(
                      controller: TextEditingController()
                        ..text = dropdownvalues[3],
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$'))
                      ],
                      onChanged: (String value) {
                        update(key1: 'quantity2', key2: 'des', newValue: value);
                        dropdownvalues[3] = value;
                      },
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {});
                        },
                        value: widget.data['quantity2']['flag1'],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            update(
                                key1: 'quantity2',
                                key2: 'flag2',
                                newValue: value);
                            flagvalues[3] = value;
                            status[3] = approve(
                                widget.data['quantity2']['flag1'],
                                flagvalues[3]);
                          });
                        },
                        value: flagvalues[3],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(Text(status[3])),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(Text('Offline Programming File')),
                  const DataCell(Center(child: Text('View File'))),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          // setState(() {
                          //   widget.data['quantity2']['flag1'] = value!;
                          // });
                        },
                        value: true,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          // setState(() {
                          //   widget.data['quantity2']['flag2'] = value!;
                          // });
                        },
                        value: true,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  const DataCell(Text('Aprroved')),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(Text('CAD File')),
                  const DataCell(Center(child: Text('View File'))),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          // setState(() {
                          //   widget.data['quantity2']['flag1'] = value!;
                          // });
                        },
                        value: true,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          // setState(() {
                          //   widget.data['quantity2']['flag2'] = value!;
                          // });
                        },
                        value: true,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  const DataCell(Text('Approved')),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(Text('Simulation File')),
                  const DataCell(Center(child: Text('View File'))),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          // setState(() {
                          //   widget.data['quantity2']['flag1'] = value!;
                          // });
                        },
                        value: true,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          // setState(() {
                          //   widget.data['quantity2']['flag2'] = value!;
                          // });
                        },
                        value: true,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  const DataCell(Text('Approved')),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text("Weld Pattern"),
                  ),
                  DataCell(
                    DropdownButton(
                        value: dropdownvalues[4],
                        items: weldPatternItems.map((String weldPatternItem) {
                          return DropdownMenuItem(
                            value: weldPatternItem,
                            child: Text(
                              weldPatternItem,
                              softWrap: true,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? NewValue) {
                          setState(() {
                            update(
                                key1: 'weldPattern',
                                key2: 'des',
                                newValue: NewValue);
                            dropdownvalues[4] = NewValue!;
                          });
                        }),
                  ),
                  DataCell(
                    Center(
                        child: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {});
                      },
                      value: widget.data['weldPattern']['flag1'],
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.deepPurpleAccent),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    )),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            update(
                                key1: 'weldPattern',
                                key2: 'flag2',
                                newValue: value);
                            flagvalues[4] = value;
                            status[4] = approve(
                                widget.data['weldPattern']['flag1'],
                                flagvalues[4]);
                          });
                        },
                        value: flagvalues[4],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(Text(status[4])),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text("Welding Mode"),
                  ),
                  DataCell(
                    DropdownButton(
                        value: dropdownvalues[5],
                        items: weldingModeItems.map((String weldModeItem) {
                          return DropdownMenuItem(
                            value: weldModeItem,
                            child: Text(weldModeItem),
                          );
                        }).toList(),
                        onChanged: (String? NewValue) {
                          setState(() {
                            update(
                                key1: 'weldingMode',
                                key2: 'des',
                                newValue: NewValue);
                            dropdownvalues[5] = NewValue!;
                          });
                        }),
                  ),
                  DataCell(
                    Center(
                        child: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {});
                      },
                      value: widget.data['weldingMode']['flag1'],
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.deepPurpleAccent),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    )),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            update(
                                key1: 'weldingMode',
                                key2: 'flag2',
                                newValue: value);
                            flagvalues[5] = value;
                            status[5] = approve(
                                widget.data['weldingMode']['flag1'],
                                flagvalues[5]);
                          });
                        },
                        value: flagvalues[5],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(Text(status[5])),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text("Weld Joint"),
                  ),
                  DataCell(
                    DropdownButton(
                        value: dropdownvalues[6],
                        items: weldJointItems.map((String weldJointItem) {
                          return DropdownMenuItem(
                            value: weldJointItem,
                            child: Text(weldJointItem),
                          );
                        }).toList(),
                        onChanged: (String? NewValue) {
                          setState(() {
                            update(
                                key1: 'weldJoint',
                                key2: 'des',
                                newValue: NewValue);
                            dropdownvalues[6] = NewValue!;
                          });
                        }),
                  ),
                  DataCell(
                    Center(
                        child: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {});
                      },
                      value: widget.data['weldJoint']['flag1'],
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.deepPurpleAccent),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    )),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            update(
                                key1: 'weldJoint',
                                key2: 'flag2',
                                newValue: value);
                            flagvalues[6] = value;
                            status[6] = approve(
                                widget.data['weldJoint']['flag1'],
                                flagvalues[6]);
                          });
                        },
                        value: flagvalues[6],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(Text(status[6])),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text("Weld Passes"),
                  ),
                  DataCell(
                    DropdownButton(
                        value: dropdownvalues[7],
                        items: weldPassItems.map((String weldPassItem) {
                          return DropdownMenuItem(
                            value: weldPassItem,
                            child: Text(weldPassItem),
                          );
                        }).toList(),
                        onChanged: (String? NewValue) {
                          setState(() {
                            update(
                                key1: 'weldPasses',
                                key2: 'des',
                                newValue: NewValue);
                            dropdownvalues[7] = NewValue!;
                          });
                        }),
                  ),
                  DataCell(
                    Center(
                        child: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {});
                      },
                      value: widget.data['weldPasses']['flag1'],
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.deepPurpleAccent),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    )),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            update(
                                key1: 'weldPasses',
                                key2: 'flag2',
                                newValue: value);
                            flagvalues[7] = value;
                            status[7] = approve(
                                widget.data['weldPasses']['flag1'],
                                flagvalues[7]);
                          });
                        },
                        value: flagvalues[7],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(Text(status[7])),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text("Weld Job Number"),
                  ),
                  DataCell(
                    DropdownButton(
                        value: dropdownvalues[8],
                        items:
                            weldJobNumberItems.map((String weldJobNumberItem) {
                          return DropdownMenuItem(
                            value: weldJobNumberItem,
                            child: Text(weldJobNumberItem),
                          );
                        }).toList(),
                        onChanged: (String? NewValue) {
                          setState(() {
                            update(
                                key1: 'weldJobNumber',
                                key2: 'des',
                                newValue: NewValue);
                            dropdownvalues[8] = NewValue!;
                          });
                        }),
                  ),
                  DataCell(
                    Center(
                        child: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {});
                      },
                      value: widget.data['weldJobNumber']['flag1'],
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.deepPurpleAccent),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    )),
                  ),
                  DataCell(
                    Center(
                      child: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            update(
                                key1: 'weldJobNumber',
                                key2: 'flag2',
                                newValue: value);
                            flagvalues[8] = value;
                            status[8] = approve(
                                widget.data['weldJobNumber']['flag1'],
                                flagvalues[8]);
                          });
                        },
                        value: flagvalues[8],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  DataCell(Text(status[8])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
