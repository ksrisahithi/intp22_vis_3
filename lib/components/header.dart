part of homepage;

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 650) {
        return Container(
          padding: const EdgeInsets.all(kSpacing),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: Theme.of(context).cardColor,
          ),
          child: Text(
            "Hello, Supervisor",
            style: TextStyle(
                color: kFontColorPalette[0],
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: .8),
          ),
        );
      } else {
        return Container(
          padding: const EdgeInsets.all(kSpacing),
          margin: const EdgeInsets.fromLTRB(kSpacing, 10, kSpacing, kSpacing),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: Theme.of(context).cardColor,
          ),
          child: Text(
            "Hello, Supervisor",
            style: TextStyle(
                color: kFontColorPalette[0],
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: .8),
          ),
        );
      }
    });
  }
}
