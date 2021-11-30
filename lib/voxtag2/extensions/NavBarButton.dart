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
    return TextButton(
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
