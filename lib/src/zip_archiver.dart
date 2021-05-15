import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zip_archive/src/channels/zip_archiver_channel.dart';
import 'dart:async';

import 'package:flutter_zip_archive/src/exceptions/zip/zip_archiver_exception.dart';

class ZipArchiver {
  ZipArchiverChannel _channel = ZipArchiverChannel();

  Future<String> get platformVersion async {
    final String version = await _channel.invokeGetPlatformVersionMethod();
    return version;
  }

  Future<String> zipDirectory({
    @required String sourceDirectoryPath,
    @required String archiveDestinationDirectoryPath,
    String password,
  }) async {
    try {
      final createdZipPath = await _channel.invokeZipDirectoryMethod(
        sourceDirPath: sourceDirectoryPath,
        archiveDestinationDirPath: archiveDestinationDirectoryPath,
        password: password,
      );
      return createdZipPath;
    } on PlatformException catch (_) {
      throw ZipArchiverException();
    }
  }

  Future<String> zipFile({
    @required String sourceFilePath,
    @required String archiveDestinationDirectoryPath,
    String password,
  }) async {
    try {
      final createdZipPath = await _channel.invokeZipFileMethod(
          sourceFilePath: sourceFilePath,
          archiveDestinationDirectoryPath: archiveDestinationDirectoryPath,
          password: password);
      return createdZipPath;
    } on PlatformException catch (_) {
      throw ZipArchiverException();
    }
  }

  Future unzip(
      {@required String zipFilePath,
      @required String destinationPath,
      String password}) async {
    return await _channel.invokeUnzipFileMethod(
      zipFilePath: zipFilePath,
      destinationPath: destinationPath,
      password: password,
    );
  }
}
