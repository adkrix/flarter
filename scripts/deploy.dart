import 'dart:io';
import 'package:dartssh2_plus/dartssh2.dart';
import 'get_ssh_env.dart';

void deploy(String localPath) async {
  final SshEnv? env = getSshEnv();
  if (env == null) {
    throw Exception('Chek .env file');
  }

  final client = SSHClient(
    await SSHSocket.connect(env.host, 22),
    username: env.user,
    identities: SSHKeyPair.fromPem(await File(env.rsakey).readAsString()),
  );
  await client.run('rm -r ${env.path}/*');

  final sftp = await client.sftp();

  var dir = Directory(localPath);
  await for (final FileSystemEntity entity in dir.list(recursive: true)) {
    final String shortPath = entity.path.split(localPath)[1];
    final String remotePath = '${env.path}/$shortPath';

    if (entity is File) {
      print('--> $shortPath');
      final file = await sftp.open(
        '${env.path}/$shortPath',
        mode: SftpFileOpenMode.create | SftpFileOpenMode.write,
      );
      await file.write(File(entity.path).openRead().cast());
    } else if (entity is Directory) {
      print('--> $shortPath');
      sftp.mkdir(remotePath);
    }
  }

  client.close();
  await client.done;
}
