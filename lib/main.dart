import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontosTotais = 0;
  
  final _perguntas = const [
    {
      'texto': 'Qual a sua idade?',
      'respostas': [
        {'texto': '15', 'pontos': 10},
        {'texto': '20', 'pontos': 10},
        {'texto': '25', 'pontos': 10},
        {'texto': '27', 'pontos': 10},
      ]
    },
    {
      'texto': 'Qual o seu signo?',
      'respostas': [
        {'texto': 'Peixes', 'pontos': 1},
        {'texto': 'Capricornio', 'pontos': 1},
        {'texto': 'Sagitario', 'pontos': 1},
        {'texto': 'Touro', 'pontos': 1},
      ]
    },
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontos': 1},
        {'texto': 'Vermelho', 'pontos': 1},
        {'texto': 'Verde', 'pontos': 1},
        {'texto': 'Amarelo', 'pontos': 1},
      ]
    },
  ];

  void _responder(int pontos) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontosTotais += pontos;
      });
    }
    print(_pontosTotais);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Forma imperativa
    // List<Widget> widgets = [];
    // for(String texto in respostas) {
    //   widgets.add(Resposta(texto,_responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : const Resultado(),
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
