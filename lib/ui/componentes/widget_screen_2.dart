import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/config/provider/registro_seguridad_provider.dart';

import '../../main.dart';

class WidgetScreen2 extends ConsumerStatefulWidget {
  const WidgetScreen2({super.key});

  @override
  ConsumerState<WidgetScreen2> createState() => _WidgetScreen2State();
}

class _WidgetScreen2State extends ConsumerState<WidgetScreen2> {
  // @override
  // void initState() {
  //   super.initState();
  //   ref.read(registroUsuarioProvider);
  // }

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
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ut egestas nisi. Pellentesque iaculis porttitor lectus fringilla consequat. Praesent feugiat, tellus ut lobortis efficitur, libero lorem accumsan mauris, in fringilla lectus erat non tortor. Morbi in orci metus. Nulla tincidunt quam condimentum ultricies eleifend. Suspendisse potenti. Sed laoreet massa orci, sed sagittis augue fermentum id. Sed sagittis posuere tellus, eu lobortis leo blandit nec. Quisque posuere tellus massa, at porttitor enim porttitor eget. Nulla nibh massa, ultrices semper ligula nec, placerat interdum arcu. Proin interdum lacus lectus, elementum rhoncus diam pulvinar eu. Donec et faucibus metus. Sed eget dictum est. Proin vel consectetur ligula. Quisque faucibus, erat quis consequat egestas, sapien enim commodo turpis, eu pharetra est augue a felis.',
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              //color: Colors.blue,
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.red[900],
                fillColor: globalIsDarkSelected
                    ? MaterialStateProperty.all(Colors.grey)
                    : null,
                value: seguridad.getAgree,
                onChanged: (value) {
                  seguridad.setAgree = value ?? true;
                },
              ),
            ),
            const Text(
              'Acepto términos y condiciones',
              overflow: TextOverflow.fade,
              style: TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 130, 129, 128)),
            )
          ],
        ),
      ],
    );
  }
}
