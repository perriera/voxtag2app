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


import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';

enum PhotosDisplayMode {
  all,
  tagged,
  untagged,
  selected,
  results,
  clear,
}

StreamController<PhotoAlbumUpdate> photoAlbum = BehaviorSubject();
StreamController<PhotosDisplayMode> displayMode = BehaviorSubject();
StreamController<StatusBarUpdate> statusBarUpdate = BehaviorSubject();

class PhotoAlbumUpdate {
  final List<VoxTagInterface> listing;

  PhotoAlbumUpdate(this.listing);
}

class PhotoAlbumUpdating extends PhotoAlbumUpdate {
  PhotoAlbumUpdating(List<VoxTagInterface> listing) : super(listing);
}

class StatusBarUpdate {
  final int total;
  final int index;

  StatusBarUpdate(this.total, this.index);
}

class StatusBarUpdating extends StatusBarUpdate {
  StatusBarUpdating(int total, int index) : super(total, index);
}
