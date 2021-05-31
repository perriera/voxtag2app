import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

class WholeRealmWidget extends StatelessWidget {
  const WholeRealmWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Image.asset(ThemeCatalog.kWholeRealm),
    );
  }
}
