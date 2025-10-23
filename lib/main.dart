import 'package:flarter/repos/repos.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'flarter_app.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractDataRepo>(() => OsmRepo());

  configureApp();

  runApp(const FlarterApp());
}
