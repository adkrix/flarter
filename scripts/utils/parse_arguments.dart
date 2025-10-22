import 'package:args/args.dart';

import 'i18n.dart';

Map<String, dynamic>? parseArguments(List<String> arguments) {
  Map<String, dynamic> opts = {};

  final parser = ArgParser()
    // actions
    ..addFlag('help', abbr: 'h', help: t('help'), defaultsTo: false)
    ..addFlag('build', abbr: 'b', help: t('build'), defaultsTo: false)
    ..addFlag('deploy', abbr: 'd', help: t('deploy'), defaultsTo: false)
    // platforms
    ..addFlag('web', abbr: 'W', help: t('web'), defaultsTo: false)
    ..addFlag('android', abbr: 'A', help: t('android'), defaultsTo: false)
    ..addFlag('linux', abbr: 'L', help: t('linux'), defaultsTo: false)
  // ..addFlag('ios', abbr: 'I', help: 'Ios platform.', defaultsTo: false)
  // ..addFlag('macos', abbr: 'M', help: 'MacOs platform.', defaultsTo: false)
  ;

  try {
    final argResults = parser.parse(arguments);

    opts['help'] = argResults['help'] as bool;
    opts['build'] = argResults['build'] as bool;
    opts['deploy'] = argResults['deploy'] as bool;

    // platforms
    opts['web'] = argResults['web'] as bool;
    opts['android'] = argResults['android'] as bool;
    opts['linux'] = argResults['linux'] as bool;
    // opts['ios'] = argResults['ios'] as bool;
    // opts['macos'] = argResults['macos'] as bool;

    if (opts['help']) {
      print('Help. (${t('canceled')})');
      print('Usage:\n${t('bash')}\n${parser.usage}');
      return null;
    }

    return opts;
  } on FormatException catch (e) {
    print(e.message);
    print('Usage:\n${t('bash')}\n${parser.usage}');
    return null;
  }
}
