import 'dart:convert';

import 'package:practice_clean_arch/domain/models/cuenta_destino/cuenta_destibo.dart';
import 'package:practice_clean_arch/domain/models/posicion_consolidada/cuenta_vista.dart';
import 'package:practice_clean_arch/domain/models/transferencia/gateway/transferencia_gateway.dart';
import 'package:practice_clean_arch/domain/models/transferencia/transferencia.dart';
import 'package:http/http.dart' as http;

class TransferenciaAdapterApi extends TransferenciaGateway {
  @override
  Future<Transferencia> transferir(Transferencia transferencia) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.34:3000/transferencia/insertar/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(transferencia.toJson()),
    );
    print(response.body);
    return transferencia;
  }
}
