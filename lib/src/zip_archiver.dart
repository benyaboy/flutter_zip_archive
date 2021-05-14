import 'package:flutter/foundation.dart';
import 'package:flutter_zip_archive/src/channels/zip_archiver_channel.dart';
import 'dart:async';

class ZipArchiver {
  ZipArchiverChannel _channel = ZipArchiverChannel();

  Future<String> get platformVersion async {
    final String version = await _channel.invokeGetPlatformVersionMethod();
    return version;
  }

  Future<Map> zipDirectory({
    @required String sourceDirectoryPath,
    @required String archiveDestinationDirectoryPath,
    String password,
  }) async {
    return await _channel.invokeZipDirectoryMethod(
      sourceDirPath: sourceDirectoryPath,
      archiveDestinationDirPath: archiveDestinationDirectoryPath,
      password: password,
    );
  }

  Future<Map> zipFile({
    @required String sourceFilePath,
    @required String archiveDestinationDirectoryPath,
    String password,
  }) {
    return _channel.invokeZipFileMethod(
        sourceFilePath: sourceFilePath,
        archiveDestinationDirectoryPath: archiveDestinationDirectoryPath,
        password: password);
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
