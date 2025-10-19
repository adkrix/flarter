import '../constants.dart';
import 'run_script.dart';

Future<void> zipDir(String path, String name) async {
  await runScript(
    'zip',
    args: ['-r', '../../$buildArkPath/$name.zip', './'],
    dir: path,
  );
}

Future<void> tgzDir(String path, String name) async {
  await runScript(
    'tar',
    args: ['-czvf', '../../$buildArkPath/$name.tar.gz', './'],
    dir: path,
  );
}
