import 'package:practice_clean_arch/domain/models/registrar_usuario/gateway/registrar_usuario_gateway.dart';
import 'package:practice_clean_arch/domain/models/registrar_usuario/registrar_usuario.dart';

class RegistrarUsuarioUsesCases {
  final RegistrarUsuarioGateway _registrarUsuarioGateway;
  RegistrarUsuarioUsesCases(this._registrarUsuarioGateway) {}

  Future<List<RegistrarUsuario>> registrarUsuarioUsesCases() {
    return _registrarUsuarioGateway.registrarUsuario();
  }
}
