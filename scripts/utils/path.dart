import 'dart:io';
import 'package:validators/validators.dart';

import '../constants.dart';
import 'pack_info.dart';

class Path {
  String _root = '';
  PackInfo? _info;

  Path(PackInfo info) {
    _root = Directory.current.path;
    _info = info;
  }
  String root(String? path) {
    return isNull(path) ? _root : '$_root/$path';
  }

  String name() {
    return _info?.name ?? 'flarter';
  }

  String landing([String? path]) {
    return root('$landingPath${isNull(path) ? '' : '/$path'}');
  }

  String landingDl([String? suffix]) {
    final fName = '${name()}${isNull(suffix) ? '' : '-$suffix'}';
    return root('$landingDlPath/$fName');
  }
}
