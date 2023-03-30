import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/domain/models/cuenta_destino/cuenta_destibo.dart';
import 'package:practice_clean_arch/domain/models/posicion_consolidada/cuenta_vista.dart';

import '../../config/provider/transferencia2_provider.dart';
import '../../config/provider/transferencia_provider.dart';
import '../../domain/models/transferencia/transferencia.dart';

class TransferenciaPage extends ConsumerStatefulWidget {
  const TransferenciaPage({super.key});

  @override
  ConsumerState<TransferenciaPage> createState() => _TransferenciaPageState();
}

class _TransferenciaPageState extends ConsumerState<TransferenciaPage> {
  String? numeroCuentaOrigen;
  String? numeroCuentaDestino;
  String motivo = "";
  String fecha = "14-03-2023";
  String monto = "";
  int id_usuario = 1;
  int id_cuenta_vista = 1;
  int idCuentaDestino = 1;
  late Future<List<CuentasVista>> cuentasVista;
  late Future<List<CuentaDestino>> cuentasDestino;

  @override
  void initState() {
    super.initState();
    ref.read(transferenciaProvider);
  }

  @override
  Widget build(BuildContext context) {
    cuentasVista = ref.watch(transferencia2Provider).obtenerCuentaVista();
    cuentasDestino = ref.watch(transferencia2Provider).obtenerCuentaDestino();
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencias'),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: cuentasVista,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final listaCuentasVista = snapshot.data;
                  return DropdownButton(
                    hint: const Text('Seleccione la cuenta de origen'),
                    value: numeroCuentaOrigen,
                    items: listaCuentasVista!.map<DropdownMenuItem>((e) {
                      return DropdownMenuItem(
                        value: e.numeroCuenta,
                        child: Text(e.numeroCuenta),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        numeroCuentaOrigen = value as String;
                      });
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: cuentasDestino,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final listaCuentasDestino = snapshot.data;
                  return DropdownButton(
                    hint: const Text('Seleccione la cuenta de destino'),
                    value: numeroCuentaDestino,
                    items: listaCuentasDestino!.map<DropdownMenuItem>((e) {
                      return DropdownMenuItem(
                        value: e.numeroCuenta,
                        child: Text(e.numeroCuenta),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        numeroCuentaDestino = value as String;
                      });
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  motivo = value;
                });
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Motivo ',
                labelText: 'Motivo',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  monto = value;
                });
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Monto ',
                labelText: 'Monto',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Transferencia transferencia = Transferencia(
                    numeroCuentaOrigen: numeroCuentaOrigen!,
                    numeroCuentaDestino: numeroCuentaDestino!,
                    motivo: motivo,
                    fecha: fecha,
                    monto: monto,
                    idUsuario: id_usuario,
                    idCuentaVista: id_cuenta_vista,
                    idCuentaDestino: idCuentaDestino,
                  );
                  ref
                      .watch(transferenciaProvider)
                      .transferirUsesCases(transferencia);
                },
                child: Text('Transferir'))
          ],
        ),
      ),
    );
  }
}
