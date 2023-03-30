import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistroSeguridadProvider extends ChangeNotifier {
  //widget Screen 2
  bool agree = false;
  bool get getAgree => agree;

  set setAgree(bool value) {
    agree = value;
    notifyListeners();
  }

  //widget Screen 3
  String pregunta1 = '';
  String get getPregunta1 => pregunta1;
  String pregunta2 = '';
  String get getPregunta2 => pregunta2;
  String pregunta3 = '';
  String get getPregunta3 => pregunta3;

  bool validarCampos() {
    if (pregunta1 == '' || pregunta2 == '' || pregunta3 == '') {
      return false;
    }
    return true;
  }

  //Widget Screen 4
  var imagenSeleccionada;
  dynamic get getImagenSeleccionada => imagenSeleccionada;

  //Widget Screen 5
  bool isCorreo = true;
  bool get getCorreo => isCorreo;
  set setCorreo(bool value) {
    isCorreo = value;
    notifyListeners();
  }

  bool isCelular = false;
  bool get getCelular => isCelular;
  set setCelular(bool value) {
    isCelular = value;
    notifyListeners();
  }
}

final registroUsuarioProvider = ChangeNotifierProvider(
  (ref) {
    return RegistroSeguridadProvider();
  },
);
