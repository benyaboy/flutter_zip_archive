import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_zip_archive/flutter_zip_archive.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller;

  final zipArchiver = ZipArchiver();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "1234");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("密码："),
                  Expanded(
                      child: TextField(
                    controller: _controller,
                  ))
                ],
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: _selectFile,
                child: Text("压缩"),
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: _unzip,
                child: Text("解压"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _selectFile() async {
    Directory tempDir = await getTemporaryDirectory();

    try {
      var zipPath = await zipArchiver.zipFile(
        sourceFilePath: tempDir.path + '/android.zip',
        archiveDestinationDirectoryPath: tempDir.path + '/new_123.zip',
        password: '1234',
      );

      print(zipPath);
    } on ZipArchiverException catch (e) {
      print(e.toString());
    }
  }

  Future _unzip() async {
    Directory _cacheDir = await getTemporaryDirectory();
    var _map = await zipArchiver.unzip(
        zipFilePath: _cacheDir.path + "/123.zip",
        destinationPath: _cacheDir.path,
        password: '1234');
    print("_map:" + _map.toString());
  }
}
