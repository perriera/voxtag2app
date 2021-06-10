import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/extensions/PageNavigator.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/search/search_tags_layout.dart';

class VoiceSearchButton extends StatelessWidget {
  const VoiceSearchButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: FontAwesomeIcons.microphone,
      title: "Voice",
      onTap: () {
        PageNavigator(context, TagsSearchLayout()).jump();
      }, // RefreshPhotoUseCase(context),
    );
  }
}
