import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/domain/uses_cases/posicion_consolidada/posicion_consolidada_usescases.dart';
import 'package:practice_clean_arch/infraestructure/driven_adapters/api/posicion_consolidada_adapter_api.dart';

final posicionConsolidadaProvider =
    Provider<PosicionConsolidadaUsesCases>((ref) {
  return PosicionConsolidadaUsesCases(PosicionConsolidadaAdapterApi());
});
