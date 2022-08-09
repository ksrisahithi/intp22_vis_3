// ignore_for_file: must_be_immutable

part of homepage;

class _CustomerCard extends StatelessWidget {
  _CustomerCard({Key? key, required this.data}) : super(key: key);

  QueryDocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          gradient: LinearGradient(colors: [Color(0xff6300ca), Theme.of(context).primaryColor, Theme.of(context).primaryColorDark],begin: Alignment.centerLeft,
                      end: Alignment.centerRight,)
        ),
      padding: const EdgeInsets.all(kSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Details',
            style: TextStyle(
                color: kFontColorPalette[2],
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: .8),
          ),
          const Divider(
            thickness: 1,
          ),
          LayoutBuilder(builder: ((context, constraints) {
            if (constraints.maxWidth < 650) {
              return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'name:',
                        style: TextStyle(
                            color: kFontColorPalette[1],
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        data['customer']['name'],
                        style: const TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'organization:',
                        style: TextStyle(
                            color: kFontColorPalette[1],
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        data['customer']['organization'],
                        style: const TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'phone number:',
                        style: TextStyle(
                            color: kFontColorPalette[1],
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        data['customer']['phone'],
                        style: const TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'address:',
                        style: TextStyle(
                            color: kFontColorPalette[1],
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        data['customer']['address'],
                        style: const TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'gst number:',
                        style: TextStyle(
                            color: kFontColorPalette[1],
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        data['customer']['gst_number'],
                        style: const TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
            } else {
              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'name:',
                            style: TextStyle(
                                color: kFontColorPalette[1],
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            data['customer']['name'],
                            style: const TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'organization:',
                            style: TextStyle(
                                color: kFontColorPalette[1],
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            data['customer']['organization'],
                            style: const TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'phone number:',
                            style: TextStyle(
                                color: kFontColorPalette[1],
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            data['customer']['phone'],
                            style: const TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'address:',
                            style: TextStyle(
                                color: kFontColorPalette[1],
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            data['customer']['address'],
                            style: const TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'gst number:',
                            style: TextStyle(
                                color: kFontColorPalette[1],
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            data['customer']['gst_number'],
                            style: const TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }
          })),
        ],
      ),
    );
  }
}
