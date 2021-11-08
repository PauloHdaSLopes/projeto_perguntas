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
        {'texto': '15', 'pontos': 1},
        {'texto': '20', 'pontos': 2},
        {'texto': '25', 'pontos': 3},
        {'texto': '27', 'pontos': 5},
      ]
    },
    {
      'texto': 'Qual o seu signo?',
      'respostas': [
        {'texto': 'Peixes', 'pontos': 3},
        {'texto': 'Capricornio', 'pontos': 1},
        {'texto': 'Sagitario', 'pontos': 2},
        {'texto': 'Touro', 'pontos': 5},
      ]
    },
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontos': 2},
        {'texto': 'Vermelho', 'pontos': 5},
        {'texto': 'Verde', 'pontos': 3},
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
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontosTotais = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
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
            : Resultado(_pontosTotais, _reiniciar),
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
