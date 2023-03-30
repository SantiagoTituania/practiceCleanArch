import 'package:practice_clean_arch/domain/models/posicion_consolidada/gateway/posicion_consolidada_gateway.dart';
import 'package:practice_clean_arch/domain/models/posicion_consolidada/posicion_consolidada.dart';

class PosicionConsolidadaUsesCases {
  final PosicionConsolidadaGateway _posicionConsolidadaGateway;
  PosicionConsolidadaUsesCases(this._posicionConsolidadaGateway);
  Future<PosicionConsolidada> consultarSaldoUseCase() {
    return this._posicionConsolidadaGateway.consultarSaldo();
  }
}
