part of homepage;

class _SideBar extends StatelessWidget {
  const _SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(






      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(kSpacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Robotic Welding Cell',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kFontColorPalette[1],
                    letterSpacing: .8,
                  ),
                )
              ],
            ),
          ),
          // const SizedBox(height: kSpacing,),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: kSpacing,
          ),
          SelectionButton(
              data: [
                SelectionButtonData(
                    activeIcon: EvaIcons.grid,
                    icon: EvaIcons.gridOutline,
                    label: "Home"),
                SelectionButtonData(
                    activeIcon: Icons.money,
                    icon: Icons.money_outlined,
                    label: "Purchase"),
                SelectionButtonData(
                    activeIcon: EvaIcons.email,
                    icon: EvaIcons.emailOutline,
                    label: "Mails",
                    totalNotif: 6),
                SelectionButtonData(
                    activeIcon: EvaIcons.archive,
                    icon: EvaIcons.archiveOutline,
                    label: "Report"),
                SelectionButtonData(
                    activeIcon: EvaIcons.person,
                    icon: EvaIcons.personOutline,
                    label: "Profile")
              ],
              onSelected: (index, value) {
                if (value.label == "Home") {
                  Get.toNamed('/homepage');
                }
              },
              initialSelected: 0),
        ],
      ),
    );
  }
}
