import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Arch',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Arquitectura Limpia'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('posicion_consolidada'),
                child: Text('Posicion Consolidada'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('transferencia'),
                child: Text('Transferencia'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('registrarUsuario'),
                child: Text('Registrar Usuario'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('verificar'),
                child: Text('Verificar Conexións'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('preguntasDeSeguridad'),
                child: Text('preguntas de seguridad'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
