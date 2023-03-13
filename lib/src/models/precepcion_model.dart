class PercepcionModel {
  String repuesta = "";
  String indicaciones = "";
  int intentos = 1;
  String idJuego = "";
  double imagenHeight = 120;
  String imagen = "";
  List<PercepcionImgParamModel> imgParam = <PercepcionImgParamModel>[];

  PercepcionModel();

  get getIndicaciones => indicaciones;

  PercepcionImgParamModel getImgParamById(String id) {
    var query = imgParam.where((I) => I.getId == id).toList();
    if (query.isEmpty) {
      return const PercepcionImgParamModel("nn", 0, 0);
    } else {
      return query.first;
    }
  }
}

class PercepcionImgParamModel {
  final String id;
  final double height;
  final double width;
  const PercepcionImgParamModel(this.id, this.height, this.width);

  get getId => id;
  get getHeight => height;
  get getWidth => width;
}
