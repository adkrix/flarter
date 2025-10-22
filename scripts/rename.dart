import 'dart:io';

import 'change_domain.dart';
import 'utils/utils.dart';

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print("Rename domain: no new domain arguments");
    return;
  }
  final newDomain = arguments[0].toString().toLowerCase();

  if (!checkDomain(newDomain)) {
    print('Wrong domain $newDomain');
    return;
  }

  print('Project will be renamed to \n--> $newDomain\n y/N');

  String? input = stdin.readLineSync() ?? '';

  if (input.toLowerCase() == 'y') {
    changeDomain(newDomain);
  }
  print(t('canceled'));
}
