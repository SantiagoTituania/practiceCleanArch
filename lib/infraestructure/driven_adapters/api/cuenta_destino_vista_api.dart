import 'dart:convert';

import 'package:practice_clean_arch/domain/models/cuenta_destino/gateway/cuenta_destino_gateway.dart';

import '../../../domain/models/cuenta_destino/cuenta_destibo.dart';
import '../../../domain/models/posicion_consolidada/cuenta_vista.dart';
import 'package:http/http.dart' as http;

class CuentaDestinoAdapterApi extends CuentaDestinoGateway {
  @override
  Future<List<CuentasVista>> obtenerCuentaVista() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.34:3000/cuenta-vista/CuentaVista/1/'),
    );
    if (response.statusCode == 200) {
      List<CuentasVista> cuentasVista = [];

      if (response.body.isNotEmpty) {
        final List<dynamic> decodedResp = json.decode(response.body);
        for (var item in decodedResp) {
          cuentasVista.add(CuentasVista.fromJson(item));
        }
      } else {
        cuentasVista = [];
      }
      return cuentasVista;
    } else {
      throw Exception('Error al obtener el dato');
    }
  }

  Future<List<CuentaDestino>> obtenerCuentaDestino() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.34:3000/cuenta-destino/cuenta_destino/3'),
    );
    if (response.statusCode == 200) {
      List<CuentaDestino> cuentasDestino = [];

      if (response.body.isNotEmpty) {
        final List<dynamic> decodedResp = json.decode(response.body);
        for (var item in decodedResp) {
          cuentasDestino.add(CuentaDestino.fromJson(item));
        }
      } else {
        cuentasDestino = [];
      }
      return cuentasDestino;
    } else {
      throw Exception('Error al obtener el dato');
    }
  }
}
