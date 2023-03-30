import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/ui/componentes/notificatios_controller_componentes.dart';
import 'package:practice_clean_arch/ui/movil/seguridad_registro_usuario_page.dart';
import 'package:practice_clean_arch/ui/movil/verificacion_page.dart';

import '../config/provider/posicion_consolidada_provider.dart';
import '../infraestructure/driven_adapters/api/registrar_usuario_adapter_api.dart';
import '../ui/movil/home_page.dart';
import '../ui/movil/posicion_consolidada_page.dart';
import '../ui/movil/registrar_usuario_page.dart';
import '../ui/movil/transferencia_page.dart';

class AppArquitecturaLimpia extends ConsumerWidget {
  const AppArquitecturaLimpia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: NotificationsController.messengerKey,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'posicion_consolidada':
            return MaterialPageRoute(
              builder: (context) => PosicionConsolidadaPage(
                posicionConsolidada: ref
                    .watch(posicionConsolidadaProvider)
                    .consultarSaldoUseCase(),
              ),
            );
          case 'home':
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );
          case '/':
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );
          case 'transferencia':
            return MaterialPageRoute(
              builder: (context) => TransferenciaPage(),
            );
          case 'registrarUsuario': //route of register user
            return MaterialPageRoute(
              builder: (context) => RegistrarUsuarioPage(),
            );
          case 'verificar': //route of register user
            return MaterialPageRoute(
              builder: (context) => Verificacion(),
            );
          case 'preguntasDeSeguridad': //route of register user
            return MaterialPageRoute(
              builder: (context) => SeguridadRegistroUsuarioPage(),
            );
          default:
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            );
        }
      },
    );
    ;
  }
}
