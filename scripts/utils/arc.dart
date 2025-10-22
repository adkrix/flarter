import 'run_script.dart';

Future<void> zipDir(String srcPath, String destPath) async {
  await runScript('zip', args: ['-r', '$destPath.zip', './'], dir: srcPath);
}

Future<void> tgzDir(String srcPath, String destPath) async {
  await runScript(
    'tar',
    // czvf
    args: ['-czf', '$destPath.tar.gz', './'],
    dir: srcPath,
  );
}
