import 'package:practice_clean_arch/domain/models/transferencia/gateway/transferencia_gateway.dart';
import 'package:practice_clean_arch/domain/models/transferencia/transferencia.dart';

class TransferenciaUsesCases {
  final TransferenciaGateway _transferenciaGateway;
  TransferenciaUsesCases(this._transferenciaGateway) {}
  Future<Transferencia> transferirUsesCases(Transferencia transferencia) {
    return this._transferenciaGateway.transferir(transferencia);
  }
}
