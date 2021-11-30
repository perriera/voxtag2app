///
/// @brief the "MIT/X Consortium License", (adapted for EXPARX.COM)
///
/// Copyright (C) November 22, 2021 EXPARX INCORPORATED
///
/// THE SOFTWARE IS  PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
/// EXPRESSED  OR   IMPLIED,  INCLUDING   BUT  NOT  LIMITED  TO  THE
/// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A  PARTICULAR PURPOSE
/// AND NON-INFRINGEMENT.  IN  NO  EVENT  SHALL EXPARX  INCORPORATED
/// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER  IN
/// AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  FROM, OUT  OF
/// OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR  OTHER DEALINGS
/// IN THE SOFTWARE.
///
/// (See LICENSE.md for complete details)
///


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/extensions/PageNavigator.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

import 'about_dialogbox.dart';

class AboutVoxTag2Button extends StatelessWidget {
  const AboutVoxTag2Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Container(
          width: 25,
          child: Image.asset("images/logos/VoxTagIcon.png"),
        ),
        title: Text(
          "About",
          style: ThemeCatalog.kOptionsItemStyle,
        ),
      ),
      onTap: () {
        // var data = PhotosAlbum().photoIds;
        // var cnt = data.photos.length;
        // ToastDialog(context).display("$cnt Photos loaded", false);
        AboutDialogBox bt = AboutDialogBox();
        PageNavigator(context, bt).jump();
      },
    );
  }
}
