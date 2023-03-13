const int MAXPREGUNTAS = 38;

String getImagen(String imgNombre) {
  switch (imgNombre.trim().toUpperCase()) {
    case "M01":
      return "assets/img/ic_m01.png";
    case "M02":
      return "assets/img/ic_m02.png";
    case "M03":
      return "assets/img/ic_m03.png";
    case "M04":
      return "assets/img/ic_m04.png";
    case "M05":
      return "assets/img/ic_m05.png";
    case "M06":
      return "assets/img/ic_m07.png";
    case "M08":
      return "assets/img/ic_m08.png";
    case "M09":
      return "assets/img/ic_m09.png";
    case "M10":
      return "assets/img/ic_m10.png";
    case "M11":
      return "assets/img/ic_m11.png";
    case "M12":
      return "assets/img/ic_m12.png";
    case "M13":
      return "assets/img/ic_m13.png";
    case "M14":
      return "assets/img/ic_m14.png";
    case "M15":
      return "assets/img/ic_m15.png";
    case "M16":
      return "assets/img/ic_m16.png";
    case "M17":
      return "assets/img/ic_m17.png";
    case "M18":
      return "assets/img/ic_m18.png";
    case "M19":
      return "assets/img/ic_m19.png";
    case "M20":
      return "assets/img/ic_m20.png";
    case "M21":
      return "assets/img/ic_m21.png";
    case "M22":
      return "assets/img/ic_m22.png";
    case "M23":
      return "assets/img/ic_m23.png.png";
    case "M24":
      return "assets/img/ic_m24.png.png";
    case "M25":
      return "assets/img/ic_m25.png";
    case "M26":
      return "assets/img/ic_m26.png";
    case "M27":
      return "assets/img/ic_m27.png";
    case "M28":
      return "assets/img/ic_m28.png";
    case "M29":
      return "assets/img/ic_m29.png";
    case "M30":
      return "assets/img/ic_m30.png";
    case "M31":
      return "assets/img/ic_m31.png";
    case "M32":
      return "assets/img/ic_m32.png";
    case "M33":
      return "assets/img/ic_m33.png";
    case "M34":
      return "assets/img/ic_m34.png";
    case "M35":
      return "assets/img/ic_m35.png";
    case "M36":
      return "assets/img/ic_m36.png";
    case "M37":
      return "assets/img/ic_m37.png";
    case "M38":
      return "assets/img/ic_m38.png";
    case "M39":
      return "assets/img/ic_m39.png";
    case "M40":
      return "assets/img/ic_m40.png";
    case "M41":
      return "assets/img/ic_m41.png";
    case "M42":
      return "assets/img/ic_m42.png";
    default:
      return imgDefault;
  }
}

String getIndicaciones(String strNombre) {
  switch (strNombre.trim().toUpperCase()) {
    case "IGUAL":
      return "Selecciona cuál imagen es igual a la de arriba.";
    case "MENOR":
      return "Selecciona cuál imagen es más pequeña que la de arriba.";
    case "MAYOR":
      return "Selecciona cuál imagen es más grande que la de arriba.";
    default:
      return percepStrindicaError;
  }
}

get percepStrindicaFound => "Buscando disponibilidad de juego.";
get percepStrindicaError => "ya no se dispone de juegos en este momento.";
get imgDefault => "assets/img/ic_percepcion.png";
