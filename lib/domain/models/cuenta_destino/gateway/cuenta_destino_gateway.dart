import 'package:practice_clean_arch/domain/models/cuenta_destino/cuenta_destibo.dart';
import '../../posicion_consolidada/cuenta_vista.dart';

abstract class CuentaDestinoGateway {
  Future<List<CuentaDestino>> obtenerCuentaDestino();
  Future<List<CuentasVista>> obtenerCuentaVista();
}
