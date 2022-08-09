part of homepage;



class ChattingCard extends StatelessWidget {
  const ChattingCard({Key? key, required this.data, required this.onPressed})
      : super(key: key);

  final DocumentSnapshot data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing, vertical: kSpacing/2),
        tileColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
        leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/user_icon.png',),backgroundColor: Colors.white,),
        title: Text(data['name'],
        style: TextStyle(
          fontSize: 13,
          color: kFontColorPalette[2],
          fontWeight: FontWeight.w600,
          letterSpacing: .8
        ),
        ),
        subtitle: Text(data['message'],
        style: const TextStyle(
          fontSize: 11,
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 2,
        ),
        trailing: (data['unread'] != 0) ? _unReadMessages() : null,
        onTap: onPressed,

      ),
    );
  }

  Widget _unReadMessages() {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: kNotifColor
      ),
      child: Center(child: Text(data['unread'].toString(), style: TextStyle(fontSize: 12, color: kFontColorPalette[3], fontWeight: FontWeight.bold),)),
    );
  }

}
