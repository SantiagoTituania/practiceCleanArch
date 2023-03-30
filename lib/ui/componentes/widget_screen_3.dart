import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/config/provider/registro_seguridad_provider.dart';
import 'package:practice_clean_arch/main.dart';
import 'package:practice_clean_arch/ui/componentes/notificatios_controller_componentes.dart';

import 'input_decorations_componentes.dart';

class WidgetScreen3 extends ConsumerStatefulWidget {
  const WidgetScreen3({super.key});

  @override
  ConsumerState<WidgetScreen3> createState() => _WidgetScreen3State();
}

class _WidgetScreen3State extends ConsumerState<WidgetScreen3> {
  String pregunta1 = '¿Cuál fue el nombre de su primera mascota?';
  String pregunta2 = '¿Cuál es el nombre de su equipo favorito?';
  String pregunta3 = '¿Cuál es el nombre de su abuelo paterno?';

  var preguntas = [
    '¿Cuál fue el nombre de su primera mascota?',
    '¿Cuál es el nombre de su equipo favorito?',
    '¿Cuál es el nombre de su abuelo paterno?',
    '¿Cuál es el nombre de su abuela materna?',
    '¿Cuál es su comida favorita?',
    '¿Cuál es su color favorito?',
    '¿Cuál es su película favorita?',
    '¿Cuál es su fruta favorita?',
    '¿Cuál es su deporte favorito?',
  ];
  @override
  Widget build(BuildContext context) {
    final seguridad = ref.watch(registroUsuarioProvider);
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Deseamos ayudarle a proteger su información personal. Elija tres preguntas de seguridad, cuyas respuestas deben ser conocidas únicamente por usted',
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '1',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton(
              value: pregunta1,
              icon: const Icon(Icons.keyboard_double_arrow_down_rounded),
              items: preguntas.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value == pregunta2 || value == pregunta3) {
                  NotificationsController.showSnackBar(
                      'La pregunta ya esta seleccionada, Escoja otra');
                  return;
                } else {
                  setState(() {
                    pregunta1 = value!;
                  });
                }
              },
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'ingrese su respuesta',
            ),
            cursorColor: globalIsDarkSelected ? Colors.white : Colors.black,
            onChanged: (value) {
              seguridad.pregunta1 = value;
            },
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '2',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton(
              value: pregunta2,
              icon: const Icon(Icons.keyboard_double_arrow_down_outlined),
              items: preguntas.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value == pregunta1 || value == pregunta3) {
                  NotificationsController.showSnackBar(
                      'La pregunta ya esta seleccionada. Seleccione otra');
                  return;
                } else {
                  setState(() {
                    pregunta2 = value!;
                  });
                }
              },
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Ingrese su respuesta',
            ),
            cursorColor: globalIsDarkSelected ? Colors.white : Colors.black,
            onChanged: (value) {
              seguridad.pregunta2 = value;
              // print(seguridad.pregunta2);
            },
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '3: ',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton(
                value: pregunta3,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: preguntas.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: const TextStyle(fontSize: 15),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == pregunta1 || value == pregunta2) {
                    NotificationsController.showSnackBar(
                        'La pregunta ya está seleccionada. Escoja otra');
                    return;
                  } else {
                    setState(() {
                      pregunta3 = value!;
                    });
                  }
                })
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Ingrese su respuesta',
            ),
            cursorColor: globalIsDarkSelected ? Colors.white : Colors.black,
            onChanged: (value) {
              seguridad.pregunta3 = value;
              // print(seguridad.pregunta3);
            },
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
