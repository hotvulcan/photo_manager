import 'dart:io';

import 'package:exif/exif.dart';

main(){
  File file = new File("example.jpg");
  printExifOf(file);
  print("good");
}

Map<String, String> printExifOf(File file) async {

  Map<String, IfdTag> data = await readExifFromBytes(await file.readAsBytes());
  Map<String, String> ret;
  data.forEach((key, value) { ret["key"] = value.toString(); });
  // if (data == null || data.isEmpty) {
  //   print("No EXIF information found\n");
  //   return;
  // }

  // if (data.containsKey('JPEGThumbnail')) {
  //   print('File has JPEG thumbnail');
  //   data.remove('JPEGThumbnail');
  // }
  // if (data.containsKey('TIFFThumbnail')) {
  //   print('File has TIFF thumbnail');
  //   data.remove('TIFFThumbnail');
  // }

  for (String key in data.keys) {
    print("$key (${data[key].tagType}): ${data[key]}");
  }
  
}