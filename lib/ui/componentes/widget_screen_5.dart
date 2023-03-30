import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/provider/registro_seguridad_provider.dart';

class WidgetScreen5 extends ConsumerStatefulWidget {
  const WidgetScreen5({super.key});

  @override
  ConsumerState<WidgetScreen5> createState() => _WidgetScreen5State();
}

class _WidgetScreen5State extends ConsumerState<WidgetScreen5> {
  @override
  Widget build(BuildContext context) {
    final seguridad = ref.watch(registroUsuarioProvider);
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Los correos pueden ser vulnerables, por eso debemos elegir el medio de transmisión adecuado de los códigos OTP.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            '¿A partir de hoy en dónde quieres recibir los códigos de seguridad OTP?',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Correo Electrónico',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 17),
                  ),
                  Switch(
                    value: seguridad.getCorreo,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      seguridad.setCorreo = value;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Celular (Mensaje de Texto)',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 17),
                  ),
                  Switch(
                    value: seguridad.getCelular,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      seguridad.setCelular = value;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            '*Recuerde seguir los tips de seguridad que le enviamos, para uso adecuado del celular y el correo, ya que el uso correcto de estos medios es total responsabilidad suya.',
            textAlign: TextAlign.justify,
            style:
                TextStyle(fontSize: 14, color: Color.fromRGBO(172, 30, 35, 1)),
          ),
        ),
      ],
    );
  }
}
