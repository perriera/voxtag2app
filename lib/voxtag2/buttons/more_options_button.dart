import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/take/take_photo.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/obsolete/change/change_columns_button.dart';

import 'change_theme_button.dart';

class MoreOptionsButton extends StatelessWidget {
  const MoreOptionsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: FontAwesomeIcons.bars,
      title: "More",
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => Container(
                  height: 280,
                  child: ListView(
                    children: <Widget>[
                      ChangeColumnsButton(),
                      TakePhotoMenuItem(),
                      ChangeThemeButton(),
                      //    HelpButton(),
                      //     AboutVoxTag2Button(),
                    ],
                  ),
                ));
      },
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:voxtag2app/obsolete/voxtag2/widgets/navbar_button.dart';
// import 'package:voxtag2app/voxtag3/views/app/usecases/change_theme/change_theme.dart';
// import 'package:voxtag2app/voxtag3/views/app/usecases/show_aboutbox/about_voxtag2_button.dart';
// import 'package:voxtag2app/voxtag3/views/app/usecases/show_help/help_button.dart';
// import 'package:voxtag2app/voxtag3/views/photos/usecases/change_gridsize/change_columns.dart';
// import 'package:voxtag2app/voxtag3/views/photos/usecases/take_photo/take_photo_button.dart';

// class PhotosMoreButton extends StatelessWidget {
//   const PhotosMoreButton({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return NavBarButton(
//       icon: FontAwesomeIcons.bars,
//       title: 'More',
//       onTap: () {
//         showModalBottomSheet(
//             context: context,
//             builder: (context) => Container(
//                   height: 280,
//                   child: ListView(
//                     children: <Widget>[
//                       ChangeColumnsButton(),
//                       TakePhotoMenuItem(),
//                       ChangeThemeButton(),
//                       HelpButton(),
//                       AboutVoxTag2Button(),
//                     ],
//                   ),
//                 ));
//       },
//     );
//   }
// }
