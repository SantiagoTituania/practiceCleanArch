import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:practice_clean_arch/config/provider/registrar_usuario_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/provider/registro_seguridad_provider.dart';

class WidgetScreen4 extends ConsumerStatefulWidget {
  const WidgetScreen4({super.key});

  @override
  ConsumerState<WidgetScreen4> createState() => _WidgetScreen4State();
}

class _WidgetScreen4State extends ConsumerState<WidgetScreen4> {
  var _selectedImageIndex;
  final _imagenes = [
    "assets/images/delfin.jpg",
    "assets/images/lobo.jpg",
    "assets/images/estudiante.jpg",
    "assets/images/vaca.jpg",
    "assets/images/auto.jpg",
    "assets/images/celular.jpg",
    "assets/images/empresario.jpg",
    "assets/images/reloj.jpg",
    "assets/images/gato.jpg",
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
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            'Seleccione una imagen para asociar a su cuenta. Esta imagen será usada para fines de seguridad',
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i <= 2; i++)
                    SelectableImage(
                      isSelected: seguridad.imagenSeleccionada == i,
                      onTap: (selectedImageIndex) {
                        setState(() {
                          seguridad.imagenSeleccionada = i;
                        });
                        //print(seguridad.getImagenSeleccionada);
                      },
                      imageAsset: _imagenes[i],
                    )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 3; i <= 5; i++)
                    SelectableImage(
                      isSelected: seguridad.imagenSeleccionada == i,
                      onTap: (selectedImageIndex) {
                        setState(() {
                          seguridad.imagenSeleccionada = i;
                        });
                        // print(seguridad.getImagenSeleccionada);
                      },
                      imageAsset: _imagenes[i],
                    ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 6; i <= 8; i++)
                    SelectableImage(
                      isSelected: seguridad.imagenSeleccionada == i,
                      onTap: (selectedImageIndex) {
                        setState(() {
                          seguridad.imagenSeleccionada = i;
                        });
                        //print(seguridad.getImagenSeleccionada);
                      },
                      imageAsset: _imagenes[i],
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectableImage extends StatelessWidget {
  const SelectableImage({
    Key? key,
    required this.isSelected,
    required this.imageAsset,
    required this.onTap,
  }) : super(key: key);
  final bool isSelected;
  final String imageAsset;
  final void Function(String imageAsset) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(imageAsset),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  width: 5,
                  color: isSelected
                      ? Color.fromRGBO(172, 30, 35, 1)
                      : Colors.transparent)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageAsset,
            ),
          ),
        ),
      ),
    );
  }
}
