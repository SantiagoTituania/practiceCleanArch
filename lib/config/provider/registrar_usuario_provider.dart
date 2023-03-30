import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/domain/uses_cases/registrar_usuario/registrar_usuario_usescases.dart';

import '../../infraestructure/driven_adapters/api/registrar_usuario_adapter_api.dart';

final registrarUsuarioProvider = Provider<RegistrarUsuarioUsesCases>((ref) {
  return RegistrarUsuarioUsesCases(RegistrarUsuarioAdapterApi());
});
