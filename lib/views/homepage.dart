// ignore_for_file: must_be_immutable

library homepage;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intp22_vis_3/constants/app_constants.dart';
import 'package:intp22_vis_3/constants/details_dropdownmenu.dart';
import 'package:intp22_vis_3/shared_components/responsive_builder.dart';
import 'package:intp22_vis_3/shared_components/selectionbutton.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

part '../components/sidebar.dart';
part '../components/header.dart';
part '../components/pending_header.dart';
part '../components/confirmed_orders_card.dart';
part '../components/profile_tile.dart';
part '../components/recent_messages.dart';
part '../components/customer_card.dart';
part '../components/porder_details.dart';
part '../components/corder_details.dart';

part '../models/profile.dart';

part '../shared_components/porders_card.dart';
part '../shared_components/chatting_card.dart';
part '../shared_components/pordersdetails_responsive.dart';

part '../views/porderspage.dart';
part '../views/corderspage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();

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
        body: ResponsiveBuilder(
          mobilebuilder: ((context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(
                      onPressedMenu: () =>
                          scaffoldKey.currentState!.openDrawer()),
                  const SizedBox(
                    height: kSpacing,
                  ),
                  _buildPorders(),
                  _buildCorders(),
                  _buildMessages()
                ],
              ),
            );
          }),
          tabbuilder: ((context, constraints) {
            return SingleChildScrollView(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 7,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(
                            onPressedMenu: () =>
                                scaffoldKey.currentState!.openDrawer()),
                        const SizedBox(
                          height: kSpacing,
                        ),
                        _buildPorders(),
                        _buildCorders()
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildProfile(
                        data: getProfile(),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      _buildMessages(),
                    ],
                  ),
                ),
              ],
            ));
          }),
          desktopbuilder: ((context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 3,
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
                        const SizedBox(
                          height: kSpacing,
                        ),
                        _buildPorders(),
                        _buildCorders()
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      _buildProfile(
                        data: getProfile(),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      _buildMessages(),
                    ],
                  ),
                ),
              ],
            );
          }),
        ));
  }
}

Widget _buildHeader({Function()? onPressedMenu}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (onPressedMenu != null)
          Padding(
            padding: const EdgeInsets.only(right: kSpacing),
            child: IconButton(
              onPressed: onPressedMenu,
              icon: const Icon(EvaIcons.menu),
              tooltip: "menu",
            ),
          ),
        const _Header(),
      ],
    ),
  );
}

Widget _buildPorders() {
  return Column(
    children: const [
      _PendingHeader(),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: kSpacing),
        child: PendingOrdersCard(),
      )
    ],
  );
}

Widget _buildCorders() {
  return const Padding(
    padding: EdgeInsets.all(kSpacing),
    child: COrdersCard(),
  );
}

Widget _buildProfile({required Profile data}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: _ProfileTile(data: data, onPressedNotification: () {}),
  );
}

Widget _buildMessages() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    child: Column(
      children: [
        _RecentMessages(onPressed: () {}),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('messages').snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return const Text('There is something wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading');
            }
            return Column(
              children: List.generate(
                  snapshot.data!.docs.length,
                  (index) => ChattingCard(
                      data: snapshot.data!.docs[index], onPressed: () {})),
            );
          }),
        ),
      ],
    ),
  );
}
