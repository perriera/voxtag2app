import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';

import 'tag_photos_usecase.dart';

class TagPhotosButton extends StatelessWidget {
  const TagPhotosButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: FontAwesomeIcons.tag,
      title: "Tag",
      onTap: () => TagPhotosUseCase(context),
    );
  }
}
