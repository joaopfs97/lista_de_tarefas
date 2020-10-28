import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //Configurando local do arquivo de armazenamento do app
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = jsonEncode(_toDoList);
    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await getFile();
      return file.readAsString(); //Tentando ler os dados do arquivo
    } catch (e) {
      return null;
    }
  }
}

