part of homepage;

class _ProfileTile extends StatelessWidget {
  const _ProfileTile(
      {Key? key, required this.data, required this.onPressedNotification})
      : super(key: key);

  final Profile data;
  final Function() onPressedNotification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(4),
      leading: CircleAvatar(
        backgroundImage: data.photo,
        backgroundColor: kHeadColorPalette[2],
      ),
      title: Text(data.name,
      style: TextStyle(
        fontSize: 14,
        color: kFontColorPalette[0],
        fontWeight: FontWeight.w600,
        letterSpacing: .8
      ),
      ),
      subtitle: Text(data.email,
      style: const TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 12
      ),
      ),
      trailing: IconButton(
        onPressed: onPressedNotification,
        icon: const Icon(EvaIcons.bellOutline),
        tooltip: 'notifications',
      ),
    );
  }
}
