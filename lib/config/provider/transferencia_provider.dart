import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/domain/uses_cases/transferencia/transferencia_usescases.dart';
import 'package:practice_clean_arch/infraestructure/driven_adapters/api/transferencia_adapter_api.dart';

final transferenciaProvider = Provider<TransferenciaUsesCases>((ref) {
  return TransferenciaUsesCases(TransferenciaAdapterApi());
});
