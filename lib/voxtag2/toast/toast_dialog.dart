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
import 'package:fluttertoast/fluttertoast.dart';

class ToastDialog {
  final BuildContext context;

  ToastDialog(this.context);

  void display(String msg, bool error) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
    );
  }
}
