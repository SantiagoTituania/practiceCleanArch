import 'package:practice_clean_arch/domain/models/posicion_consolidada/cuenta_credito.dart';
import 'package:practice_clean_arch/domain/models/posicion_consolidada/cuenta_inversion.dart';
import 'package:practice_clean_arch/domain/models/posicion_consolidada/cuenta_vista.dart';

class PosicionConsolidada {
  final List<CuentasVista>? cuentaVista;
  final List<CuentaCredito>? cuentaCredito;
  final List<CuentasInversion>? cuentaInversion;

  PosicionConsolidada(
      {this.cuentaVista, this.cuentaCredito, this.cuentaInversion}) {}
}
