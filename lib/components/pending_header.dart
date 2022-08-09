part of homepage;

class _PendingHeader extends StatelessWidget {
  const _PendingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Text('Pending Orders',
          style: TextStyle(
            fontWeight: FontWeight.w600, 
            color: kFontColorPalette[1],
            fontSize: 18
            ),
          ),
        )
      ],
    );
  }
}