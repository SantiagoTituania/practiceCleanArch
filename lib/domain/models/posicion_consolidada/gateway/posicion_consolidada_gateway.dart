import 'package:practice_clean_arch/domain/models/posicion_consolidada/posicion_consolidada.dart';

abstract class PosicionConsolidadaGateway {
  Future<PosicionConsolidada> consultarSaldo();
}
