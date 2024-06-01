import 'dart:io';

void main() {
  final assetDir = Directory('assets');
  final assetFolders = assetDir.listSync(recursive: true)
      .whereType<Directory>()
      .map((dir) => dir.path)
      .where((path) => path != 'assets'); // Exclude the root assets directory

  final buffer = StringBuffer();
  buffer.writeln('flutter:');
  buffer.writeln('  assets:');

  for (var folder in assetFolders) {
    buffer.writeln('    - $folder/');
  }

  final pubspecFile = File('pubspec.yaml');
  final pubspecContent = pubspecFile.readAsStringSync();

  final newPubspecContent = pubspecContent.replaceFirst(
      RegExp(r'flutter:\n(  assets:\n(    - .+\n)*)?'),
      buffer.toString()
  );

  pubspecFile.writeAsStringSync(newPubspecContent);

  print('Assets have been added to pubspec.yaml');
}
