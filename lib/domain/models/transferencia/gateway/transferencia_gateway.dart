import 'package:practice_clean_arch/domain/models/transferencia/transferencia.dart';

abstract class TransferenciaGateway {
  Future<Transferencia> transferir(Transferencia transferencia);
}
