import 'constants.dart';
import 'deploy.dart';
import 'utils/arc.dart';
import 'utils/utils.dart';

void main(List<String> arguments) async {
  Map<String, dynamic>? opts = parseArguments(arguments);

  if (opts == null) {
    return;
  }

  final bool noPlatform = !opts['web'] && !opts['android'] && !opts['linux'];
  var info = await packInfo();
  var path = Path(info);

  if (opts['build']) {
    if (opts['web'] || noPlatform) {
      printTitle('Build web');
      await runScript('flutter', args: ['build', 'web']);
      printTitle('copy  web build to _web');
      await runScript('cp', args: ['-r', buildWebPath, webPath]);
      printTitle('Archive `web` to _landing');
      await tgzDir(buildWebPath, path.landingDl('web'));
    }
    // build android
    if (opts['android'] || noPlatform) {
      printTitle('Build android');
      await runScript('flutter', args: buildAndroidArgs);
      printTitle('Copy  apk to _landing');
      await runScript('cp', args: [buildApkPath, '${path.landingDl()}.apk']);
    }

    if (opts['linux'] || noPlatform) {
      printTitle('Build linux');
      await runScript('flutter', args: buildLinuxArgs);
      printTitle('Archive `linux` to _landing');
      await tgzDir(buildLinuxPath, path.landingDl('linux'));
    }
  }

  if (opts['deploy']) {
    printTitle('Deploy _landing');
    deploy('${path.landing()}/');
  }
}
