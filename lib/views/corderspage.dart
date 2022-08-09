part of homepage;

class COrdersPage extends StatefulWidget {
  const COrdersPage({Key? key}) : super(key: key);

  @override
  State<COrdersPage> createState() => _COrdersPageState();
}

class _COrdersPageState extends State<COrdersPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var data = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: (ResponsiveBuilder.isDesktop(context))
            ? null
            : const Drawer(
                child: Padding(
                  padding: EdgeInsets.only(top: kSpacing),
                  child: _SideBar(),
                ),
              ),
        body: ResponsiveBuilder(mobilebuilder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(
                    onPressedMenu: () =>
                        scaffoldKey.currentState!.openDrawer()),
                _buildCustomerCard(data: data),
                _buildCOrderDetails(data: data)
              ],
            ),
          );
        }, tabbuilder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(
                    onPressedMenu: () =>
                        scaffoldKey.currentState!.openDrawer()),
                _buildCustomerCard(data: data),
                _buildCOrderDetails(data: data)
              ],
            ),
          );
        }, desktopbuilder: (context, constraints) {
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
                        _buildCOrderDetails(data: data)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}

Widget _buildCOrderDetails({required QueryDocumentSnapshot data}) {
  return Padding(
    padding: const EdgeInsets.all(kSpacing),
    child: COrderDetails(data: data),
  );
}
