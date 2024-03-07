import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "Resultado";

  _recuperarCep() async {

    String cep = _controllerCep.text;
    var url = Uri.parse("https://viacep.com.br/ws/${cep}/json/");
    http.Response response;
    
    response = await http.get(url as Uri);
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];

    setState(() {
      _resultado = "${logradouro}, ${bairro}, ${localidade}, ${uf}";
    });

    //print("Resposta: " + response.statusCode.toString());
    //print("Resposta: " + response.body);

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscador de Cep"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o CEP"
              ),
              style: TextStyle(
                fontSize: 20
              ),
              controller: _controllerCep,
            ),
            ElevatedButton(
              onPressed: _recuperarCep,
              child: Text("Buscar")
            ),
            Text(_resultado),
          ],
        ),
        )
      ),
    );
  }
}