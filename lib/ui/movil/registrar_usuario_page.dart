import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/config/provider/registrar_usuario_provider.dart';
import 'package:practice_clean_arch/domain/models/registrar_usuario/registrar_usuario.dart';

class RegistrarUsuarioPage extends ConsumerStatefulWidget {
  const RegistrarUsuarioPage({super.key});

  @override
  ConsumerState<RegistrarUsuarioPage> createState() =>
      _RegistrarUsuarioPageState();
}

class _RegistrarUsuarioPageState extends ConsumerState<RegistrarUsuarioPage> {
  final cedula = TextEditingController();
  final celular = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  late Future<List<RegistrarUsuario>> usuarios;

  String cedulaUsuario = '';
  String telefonoUsuario = '';
  String emailUsuario = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    ref.read(registrarUsuarioProvider);
  }

  @override
  Widget build(BuildContext context) {
    usuarios = ref.watch(registrarUsuarioProvider).registrarUsuarioUsesCases();
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro de Usuario'),
        ),
        body: FutureBuilder(
          future: usuarios,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: cedula,
                      onChanged: (value) {
                        setState(() {
                          cedulaUsuario = value;
                        });
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.chrome_reader_mode_rounded),
                        hintText: 'cedula ',
                        labelText: 'cedula',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: celular,
                      onChanged: (value) {
                        setState(() {
                          telefonoUsuario = value;
                        });
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone_iphone_sharp),
                        hintText: 'celular ',
                        labelText: 'celular',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      onChanged: (value) {
                        setState(() {
                          emailUsuario = value;
                        });
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'email ',
                        labelText: 'email',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: pass,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password_sharp),
                        hintText: 'password ',
                        labelText: 'password',
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          for (var element in snapshot.data!) {
                            if (element.cedulaUsuario == cedulaUsuario) {
                              print('usuario existente, registrado con exito');
                              showAlertUserRegisterOk();
                              return;
                            } else {
                              print('usuario no registrado');
                              showAlertUserRegisterFail();
                            }
                          }
                        },
                        child: Text('Registrar'))
                  ],
                ),
              );
            }

            return CircularProgressIndicator();
          },
        ));
  }

  void showAlertUserRegisterOk() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Información de usuario'),
            content: const Text('Registro de usuario existoso'),
            actions: [
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.download_done_sharp),
                label: Text('Continuar'),
              ),
            ],
          );
        });
  }

  void showAlertUserRegisterFail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Información de usuario'),
            content: const Text('Usuario no encontrado, solicite una cuenta!'),
            actions: [
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_circle_left_outlined),
                label: Text('Volver'),
              ),
            ],
          );
        });
  }
}
