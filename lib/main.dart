import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:viacep/models/endere%C3%A7o_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Via Cep'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  EnderecoModel enderecoModel = EnderecoModel();

  var enderecoController = TextEditingController();

  buscarEndereco() async {
    var response = await Dio()
        .get("https://viacep.com.br/ws/${enderecoController.text}/json");
    enderecoModel = EnderecoModel.fromJson(response.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              child: TextField(
                controller: enderecoController,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: buscarEndereco,
            child: Text("CEP"),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text("Cep:${enderecoModel.cep}"),
                Text("Logradouro:${enderecoModel.logradouro}"),
                Text("Bairro:${enderecoModel.bairro}"),
                Text("UF:${enderecoModel.uf}")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
