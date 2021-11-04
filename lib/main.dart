import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual a sua idade?',
        'respostas': [15, 20, 25, 27]
      },
      {
        'texto': 'Qual o seu signo?',
        'respostas': ['Peixes', 'Capricornio', 'Sagitario', 'Touro']
      },
      {
        'texto': 'Qual a sua cor favorita?',
        'respostas': ['Azul', 'Vermelho', 'Verde', 'Amarelo']
      },
    ];

    List<Widget> respostas = [];
    for(String texto in perguntas[_perguntaSelecionada].cast()['respostas']) {
      // respostas.add(Resposta(texto,_responder));
      print(texto);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas
          ],
        )
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}