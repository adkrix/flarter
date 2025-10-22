const cancelOpts = 'Cancels other options.';

const dict = {
  'examples': '',
  'bash':
      '''
-c \t\t Clear console.
-s \t\t Run landing server. $cancelOpts
-S \t\t Run web build server. $cancelOpts
-n Rename project with positional name (like com.domain.app) $cancelOpts
-f \t\t Format code.
-C \t\t Clean project  cash.
-r \t\t Run development in Chrome. $cancelOpts
-R \t\t Run development in Linux. $cancelOpts
-e \t\t Show examples. $cancelOpts''',
  'help': 'Show help. $cancelOpts',
  'canceled': 'Other options were cancelled.',
  'build': 'Build project.',
  'deploy': 'Deploy project.',
  'web': 'Web platform.',
  'android': 'Android platform.',
  'linux': 'Linux platform.',
};

String t(String key) {
  return dict[key] ?? key;
}
