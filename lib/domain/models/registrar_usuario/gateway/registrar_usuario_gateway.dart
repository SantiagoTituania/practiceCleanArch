import 'package:practice_clean_arch/domain/models/registrar_usuario/registrar_usuario.dart';

abstract class RegistrarUsuarioGateway {
  Future<List<RegistrarUsuario>> registrarUsuario();
}
