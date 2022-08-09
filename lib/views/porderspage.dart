// ignore_for_file: prefer_const_constructors_in_immutables

part of homepage;

class POrdersPage extends StatefulWidget {
  POrdersPage({Key? key}) : super(key: key);

  @override
  State<POrdersPage> createState() => _POrdersPageState();
}

class _POrdersPageState extends State<POrdersPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var data = Get.arguments[0];

  DocumentReference reference = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: (ResponsiveBuilder.isDesktop(context))
            ? null
            : const Drawer(
                child: Padding(
                    padding: EdgeInsets.only(top: kSpacing),
                    child: _SideBar()),
              ),
        body: ResponsiveBuilder(
          desktopbuilder: (context, constriants) {
            return Scrollbar(
              thumbVisibility: true,
              child: Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: Container(
                        color: Theme.of(context).cardColor,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: const [
                            _SideBar(),
                          ],
                        ),
                      )),
                  Flexible(
                    flex: 9,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _Header(),
                          _buildCustomerCard(data: data),
                          _buildPOrderDetails(data: data, ref: reference)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          mobilebuilder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(
                      onPressedMenu: () =>
                          scaffoldKey.currentState!.openDrawer()),
                  _buildCustomerCard(data: data),
                  _buildPOrderDetails(data: data, ref: reference)
                ],
              ),
            );
          },
          tabbuilder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(
                      onPressedMenu: () =>
                          scaffoldKey.currentState!.openDrawer()),
                  _buildCustomerCard(data: data),
                  _buildPOrderDetails(data: data, ref: reference)
                ],
              ),
            );
          },
        ));
  }
}

Widget _buildCustomerCard({required QueryDocumentSnapshot data}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: _CustomerCard(data: data),
  );
}

Widget _buildPOrderDetails(
    {required QueryDocumentSnapshot data, required DocumentReference ref}) {
  return Padding(
    padding: const EdgeInsets.all(kSpacing),
    child: POrderDetails(
      data: data,
      reference: ref,
    ),
  );
}
