import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder});

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  @override
  Widget build(BuildContext context) {
    // List<String> respostas = temPerguntaSelecionada ? perguntas[perguntaSelecionada].cast()['respostas'] : [];

    List<Map<String, Object>> respostas =
        perguntas[perguntaSelecionada].cast()['respostas'];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((t) {
          var pontos = int.parse(t['pontos'].toString());
          return Resposta(t['texto'].toString(),
              () => responder(pontos));
        })
      ],
    );
  }
}
