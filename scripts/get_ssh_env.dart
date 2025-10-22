import 'package:dotenv/dotenv.dart';

class SshEnv {
  final String host;
  final String user;
  final String path;
  final String rsakey;

  SshEnv({
    required this.host,
    required this.user,
    required this.path,
    required this.rsakey,
  });
  String server() {
    return '$user@$host';
  }

  String fukPath() {
    return '$user@$host:$path';
  }
}

SshEnv? getSshEnv() {
  var env = DotEnv(includePlatformEnvironment: true)..load(['scripts/.env']);
  var host = env['SSH_HOST'];
  var user = env['SSH_USER'];
  var path = env['SSH_PATH'];
  var rsakey = env['SSH_KEY'];

  if (host == null || user == null || path == null) {
    return null;
  } else {
    return SshEnv(
      host: host,
      user: user,
      path: path,
      rsakey: rsakey ?? '~/.ssh/id_rsa',
    );
  }
}
