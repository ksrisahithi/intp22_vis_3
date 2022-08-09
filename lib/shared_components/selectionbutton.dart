import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intp22_vis_3/constants/app_constants.dart';

class SelectionButtonData {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotif;

  SelectionButtonData(
      {required this.activeIcon,
      required this.icon,
      required this.label,
      this.totalNotif});
}

class SelectionButton extends StatefulWidget {
  const SelectionButton(
      {Key? key,
      required this.data,
      required this.onSelected,
      this.initialSelected = 0})
      : super(key: key);

  final int initialSelected;
  final List<SelectionButtonData> data;
  final Function(int index, SelectionButtonData value) onSelected;

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  late int selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.data.asMap().entries.map((e) {
        final index = e.key;
        final data = e.value;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: _Button(
              selected: selected == index,
              data: data,
              onPressed: () {
                widget.onSelected(index, data);
                setState(() {
                  selected = index;
                });
              }),
        );
      }).toList(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {Key? key,
      required this.selected,
      required this.data,
      required this.onPressed})
      : super(key: key);

  final bool selected;
  final SelectionButtonData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: (!selected)
          ? Theme.of(context).cardColor
          : Theme.of(context).canvasColor.withOpacity(0.8),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Row(
            children: [
              _icon((!selected) ? data.icon : data.activeIcon),
              const SizedBox(
                width: kSpacing / 2,
              ),
              Expanded(
                child: _labelText(data.label),
              ),
              if (data.totalNotif != null)
                Padding(
                  padding: const EdgeInsets.only(left: kSpacing / 2),
                  child: _notif(data.totalNotif!),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon(IconData iconData) {
    return Icon(
      iconData,
      size: 20,
      color:
          !selected ? kFontColorPalette[2] : Theme.of(Get.context!).focusColor,
    );
  }

  Widget _labelText(String data) {
    return Text(
      data,
      style: TextStyle(
          color: !selected
              ? kFontColorPalette[1]
              : Theme.of(Get.context!).focusColor,
          fontWeight: FontWeight.w600,
          letterSpacing: .8,
          fontSize: 13),
    );
  }

  Widget _notif(int total) {
    return (total <= 0)
        ? Container()
        : Container(
            width: 28,
            height: 28,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: kNotifColor),
            alignment: Alignment.center,
            child: Text(
              (total >= 100) ? "99+" : "$total",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}
