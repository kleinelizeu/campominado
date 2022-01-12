import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';
import '../models/campo.dart';

class CampoWidget extends StatelessWidget {
  const CampoWidget({
    Key key,
    @required this.campo,
    @required this.onAbrir,
    @required this.onAlternarMarcacao,
  }) : super(key: key);

  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  Widget _getImage() {
    int qtdMinas = campo.qtdeMinasNaVizinhaca;
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (campo.aberto) {
      return Image.asset('assets/images/aberto_$qtdMinas.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
