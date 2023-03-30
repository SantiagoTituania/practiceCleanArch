import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/ui/componentes/slider_seguridad_registro_componentes.dart';

import '../../config/provider/registro_seguridad_provider.dart';
import '../componentes/notificatios_controller_componentes.dart';

class SeguridadRegistroUsuarioPage extends ConsumerStatefulWidget {
  const SeguridadRegistroUsuarioPage({super.key});

  @override
  ConsumerState<SeguridadRegistroUsuarioPage> createState() =>
      _SeguridadRegistroUsuarioPageState();
}

class _SeguridadRegistroUsuarioPageState
    extends ConsumerState<SeguridadRegistroUsuarioPage> {
  List<SliderModel> sliders = <SliderModel>[];
  int currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    sliders = getSliders();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final seguridad = ref.watch(registroUsuarioProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completa tu cuenta'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: sliders.length,
              itemBuilder: (context, index) {
                if (index == 0 || index == 5) {
                  return Slider16(
                    image: sliders[index].getImage(),
                    title: sliders[index].getTitle(),
                    description: sliders[index].getDescription(),
                  );
                } else {
                  print(seguridad.agree);
                  return Slider2345(
                    image: sliders[index].getImage(),
                    title: sliders[index].getTitle(),
                    description: sliders[index].getDescription(),
                    widget: sliders[index].getWidget(),
                  );
                }
              },
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  sliders.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                if (currentIndex == sliders.length - 1) {
                  Navigator.pushReplacementNamed(
                    context,
                    'verificar',
                  );
                }
                if (currentIndex == 1 && seguridad.getAgree == false) {
                  NotificationsController.showSnackBar(
                      'Debe aceptar los terminos para continuar');
                } else if (currentIndex == 2 &&
                    seguridad.validarCampos() == false) {
                  NotificationsController.showSnackBar(
                      'Faltan preguntas por responder');
                } else if (currentIndex == 3 &&
                    seguridad.getImagenSeleccionada == null) {
                  NotificationsController.showSnackBar(
                      'Debe seleccionar una imagen');
                } else if (currentIndex == 4 &&
                    seguridad.isCelular == false &&
                    seguridad.isCorreo == false) {
                  NotificationsController.showSnackBar(
                      'Debe habilitar al menos una opción');
                } else {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.decelerate);
                  seguridad.setAgree = false;
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.cyan,
              disabledColor: Colors.grey,
              child: Text(
                currentIndex == sliders.length - 1 ? 'Finalizar' : 'Siguiente',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 30 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(30, 172, 153, 1),
      ),
    );
  }
}

class Slider2345 extends StatelessWidget {
  String? image;
  String? title;
  String? description;
  Widget? widget;

  Slider2345({
    Key? key,
    this.image,
    this.title,
    this.description,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Image.asset(
            image!,
            scale: 4.5,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              title!,
              style: const TextStyle(fontSize: 21),
            ),
          ),
          const SizedBox(height: 10),
          Container(child: widget),
        ],
      ),
    );
  }
}

class Slider16 extends StatelessWidget {
  String? image;
  String? title;
  String? description;

  Slider16({super.key, this.image, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image!),
          const SizedBox(height: 25),
          Center(
            child: Text(
              title!,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              description!,
              style: const TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
