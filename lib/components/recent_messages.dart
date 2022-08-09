part of homepage;

class _RecentMessages extends StatelessWidget {
  const _RecentMessages({Key? key, required this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 650) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                EvaIcons.messageCircle,
                color: Theme.of(context).primaryColorLight,
              ),
              const SizedBox(
                width: 10,
              ),
              Text("Recent Messages",
                  style: TextStyle(color: Theme.of(context).primaryColorLight)),
            ],
          ),
        );
      } else {
        return Row(
          children: [
            Icon(
              EvaIcons.messageCircle,
              color: Theme.of(context).primaryColorLight,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Recent Messages",
              style: TextStyle(color: Theme.of(context).primaryColorLight),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(EvaIcons.moreVertical),
              tooltip: 'more',
              color: kFontColorPalette[0],
            )
          ],
        );
      }
    });
  }
}
