import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/access/display_access_status.dart';

class UBDError extends StatelessWidget {
  final String msg;
  final String whereTo;
  const UBDError({
    Key key,
    this.msg,
    this.whereTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, whereTo);
      },
      child: DisplayAccessStatus(msg: msg),
    );
  }
}
