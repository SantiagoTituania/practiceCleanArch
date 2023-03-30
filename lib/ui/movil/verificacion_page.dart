import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/registrar_usuario/registrar_usuario.dart';

class Verificacion extends StatefulWidget {
  const Verificacion({super.key});

  @override
  State<Verificacion> createState() => _VerificacionState();
}

class _VerificacionState extends State<Verificacion> {
  late Future<List<RegistrarUsuario>> usuarios;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificacion de usuarios'),
      ),
      body: FutureBuilder<List<RegistrarUsuario>>(
          future: usuarios,
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                itemCount: snap.data!.length,
                itemBuilder: (context, i) {
                  return Text(snap.data![i].cedulaUsuario);
                },
              );
            }
            if (snap.hasError) {
              return Center(
                child: Text('Se ha generado un error'),
              );
            }
            return CircularProgressIndicator();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertUserRegister();
        },
        child: Icon(Icons.add_alert_sharp),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    usuarios = registrarUsuario();
  }

  Future<List<RegistrarUsuario>> registrarUsuario() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.34:3000/usuario/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final List<dynamic> decodedResp = jsonDecode(response.body);
    List<RegistrarUsuario> usuarios = [];
    decodedResp.forEach((element) {
      final RegistrarUsuario user = RegistrarUsuario.fromJson(element);
      usuarios.add(user);
    });
    print(usuarios);
    return usuarios;
  }

  void showAlertUserRegister() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Información de usuario'),
            content: Text('El usuario ya se encuentra registrado'),
            actions: [
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.cancel_presentation_outlined),
                label: Text('Cancelar'),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.download_done_outlined),
                label: Text('Aceptar'),
              ),
            ],
          );
        });
  }
}
