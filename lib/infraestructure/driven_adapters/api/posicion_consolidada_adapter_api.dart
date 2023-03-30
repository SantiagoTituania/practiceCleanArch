import 'dart:convert';

import 'package:practice_clean_arch/domain/models/posicion_consolidada/gateway/posicion_consolidada_gateway.dart';
import 'package:practice_clean_arch/domain/models/posicion_consolidada/posicion_consolidada.dart';
import 'package:http/http.dart' as http;

import '../../../domain/models/posicion_consolidada/cuenta_credito.dart';
import '../../../domain/models/posicion_consolidada/cuenta_inversion.dart';
import '../../../domain/models/posicion_consolidada/cuenta_vista.dart';

class PosicionConsolidadaAdapterApi extends PosicionConsolidadaGateway {
  @override
  Future<PosicionConsolidada> consultarSaldo() async {
    Uri url =
        //Uri.parse('http://192.168.1.11:3000/usuario/posicion_consolidada/1');
        Uri.parse('http://192.168.1.34:3000/usuario/posicion_consolidada/1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      PosicionConsolidada posicion = PosicionConsolidada(
          cuentaVista: [], cuentaCredito: [], cuentaInversion: []);
      if (response.body.length > 0) {
        final Map<String, dynamic> decodedResp = json.decode(response.body);
        if (decodedResp.containsKey('cuentas_vista') ||
            decodedResp.containsKey('cuentas_credito') ||
            decodedResp.containsKey('cuentas_inversion')) {
          List<dynamic> ahorros = decodedResp['cuentas_vista'];
          List<dynamic> credito = decodedResp['cuentas_credito'];
          List<dynamic> inversion = decodedResp['cuentas_inversion'];
          List<CuentasVista> listaAhorros = [];
          for (var item in ahorros) {
            listaAhorros.add(CuentasVista.fromJson(item));
          }
          List<CuentaCredito> listaCredito = [];
          for (var item in credito) {
            listaCredito.add(CuentaCredito.fromJson(item));
          }
          List<CuentasInversion> listaInversion = [];
          for (var item in inversion) {
            listaInversion.add(CuentasInversion.fromJson(item));
          }
          posicion = PosicionConsolidada(
              cuentaVista: listaAhorros,
              cuentaCredito: listaCredito,
              cuentaInversion: listaInversion);
        }
      }
      return posicion;
    } else {
      throw Exception('Error al obtener el dato del día');
    }
  }
}
