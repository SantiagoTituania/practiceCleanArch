import 'package:flutter/material.dart';
import 'package:practice_clean_arch/domain/models/registrar_usuario/gateway/registrar_usuario_gateway.dart';
import 'package:practice_clean_arch/domain/models/registrar_usuario/registrar_usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrarUsuarioAdapterApi extends RegistrarUsuarioGateway {
  final cedula = TextEditingController();
  final celular = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Future<List<RegistrarUsuario>> registrarUsuario() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.34:3000/usuario'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    //print(response.body);
    List<dynamic> decodedResp = json.decode(response.body);
    //print(decodedResp[3]);
    List<RegistrarUsuario> listaUsuarios = [];
    for (var item in decodedResp) {
      listaUsuarios.add(RegistrarUsuario.fromJson(item));
    }

    // print(decodedResp['cedula_usuario']);

    return listaUsuarios;
  }
}
