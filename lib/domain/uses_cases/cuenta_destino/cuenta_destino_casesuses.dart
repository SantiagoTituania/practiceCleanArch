import 'package:practice_clean_arch/domain/models/cuenta_destino/gateway/cuenta_destino_gateway.dart';
import 'package:practice_clean_arch/domain/models/posicion_consolidada/cuenta_vista.dart';

import '../../models/cuenta_destino/cuenta_destibo.dart';

class CuentaDestinoUsesCases {
  final CuentaDestinoGateway _cuentaDestinoGateway;
  CuentaDestinoUsesCases(this._cuentaDestinoGateway) {}

  Future<List<CuentaDestino>> obtenerCuentaDestino() {
    return _cuentaDestinoGateway.obtenerCuentaDestino();
  }

  Future<List<CuentasVista>> obtenerCuentaVista() {
    return _cuentaDestinoGateway.obtenerCuentaVista();
  }
}
