import 'package:flutter/cupertino.dart';

import 'display_access_status.dart';

class AccessPhotosApp extends StatefulWidget {
  const AccessPhotosApp({Key key}) : super(key: key);

  @override
  _AccessPhotosAppState createState() => _AccessPhotosAppState();
}

class _AccessPhotosAppState extends State<AccessPhotosApp> {
  @override
  Widget build(BuildContext context) {
    return DisplayAccessStatus(msg: 'Hello');
  }
}
