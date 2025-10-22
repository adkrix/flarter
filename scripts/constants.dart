const srcDomain = 'su.zor.flarter';

const rootDir = 'android/app/src/main/kotlin';

const mainFileName = 'MainActivity.kt';

const buildApkPath = 'build/app/outputs/apk/release/app-release.apk';
const buildWebPath = 'build/web';
const buildLinuxPath = 'build/linux/x64/release/bundle';

const landingPath = '_landing';
const landingDlPath = '_landing/dl';
const webPath = '_web';

// args
const buildAndroidArgs = [
  'build',
  'apk',
  '--release',
  '--target-platform',
  'android-arm64',
];
const buildLinuxArgs = [
  'build',
  'linux',
  '--release',
  '--target-platform',
  'linux-x64',
];
