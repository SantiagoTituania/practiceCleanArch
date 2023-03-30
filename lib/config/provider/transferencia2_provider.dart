import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/domain/uses_cases/cuenta_destino/cuenta_destino_casesuses.dart';
import 'package:practice_clean_arch/domain/uses_cases/transferencia/transferencia_usescases.dart';
import 'package:practice_clean_arch/infraestructure/driven_adapters/api/cuenta_destino_vista_api.dart';
import 'package:practice_clean_arch/infraestructure/driven_adapters/api/transferencia_adapter_api.dart';

final transferencia2Provider = Provider<CuentaDestinoUsesCases>((ref) {
  return CuentaDestinoUsesCases(CuentaDestinoAdapterApi());
});
