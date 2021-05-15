import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zip_archive/src/extensions/map/remove_null_values.dart';
import 'dart:async';

class ZipArchiverChannel {
  static const MethodChannel _zipArchiveChannel =
      const MethodChannel('flutter_zip_archive');

  Future<String> invokeZipFileMethod({
    @required String sourceFilePath,
    @required String archiveDestinationDirectoryPath,
    String password,
  }) async {
    assert(sourceFilePath != null);
    assert(archiveDestinationDirectoryPath != null);

    return await _zipArchiveChannel.invokeMethod(
        'zipFile',
        <String, dynamic>{
          "src": sourceFilePath,
          "dest": archiveDestinationDirectoryPath,
          "password": password,
        }..removeNullValues());
  }

  Future<String> invokeZipDirectoryMethod({
    @required String sourceDirPath,
    @required String archiveDestinationDirPath,
    String password,
  }) async {
    assert(sourceDirPath != null);
    assert(archiveDestinationDirPath != null);

    return await _zipArchiveChannel.invokeMethod(
        'zipDir',
        <String, dynamic>{
          "src": sourceDirPath,
          "dest": archiveDestinationDirPath,
          "password": password,
        }..removeNullValues());
  }

  Future<String> invokeGetPlatformVersionMethod() {
    return _zipArchiveChannel.invokeMethod('getPlatformVersion');
  }

  Future<Map> invokeUnzipFileMethod({
    @required String zipFilePath,
    @required String destinationPath,
    String password,
  }) {
    return _zipArchiveChannel.invokeMethod(
        'unzip',
        <String, dynamic>{
          "zip": zipFilePath,
          "dest": destinationPath,
          "password": password,
        }..removeNullValues());
  }
}
