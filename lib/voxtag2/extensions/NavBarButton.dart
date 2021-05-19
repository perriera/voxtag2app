import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    @required this.icon,
    @required this.title,
    @required this.onTap,
  });

  final IconData icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      autofocus: true,
      onPressed: this.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 30.0,
            color: ThemeCatalog.kIconColor,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(title, style: ThemeCatalog.kNavBarTextStyle)
        ],
      ),
    );
  }
}
