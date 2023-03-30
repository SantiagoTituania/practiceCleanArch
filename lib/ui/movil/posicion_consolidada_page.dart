import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_clean_arch/domain/models/posicion_consolidada/posicion_consolidada.dart';

class PosicionConsolidadaPage extends StatelessWidget {
  final Future<PosicionConsolidada> posicionConsolidada;
  const PosicionConsolidadaPage({super.key, required this.posicionConsolidada});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posicion Consolidada'),
      ),
      body: Center(
        child: FutureBuilder(
          future: posicionConsolidada,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var listaAhorrosVista = snapshot.data!.cuentaVista;
              var listaCredito = snapshot.data!.cuentaCredito;
              var listaInversion = snapshot.data!.cuentaInversion;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Card(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: listaAhorrosVista!.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              Text('Cuenta Vista:'),
                              Text(listaAhorrosVista![index].numeroCuenta),
                            ],
                          );
                        })),
                  ),
                  Card(
                    child:
                        //Text('tamaño: ${snapshot.data!.cuentasVista!.length}'),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: listaCredito!.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  Text('Cuenta Credito:'),
                                  Text(listaCredito![index].numeroCuenta),
                                ],
                              );
                            })),
                  ),
                  Card(
                    child:
                        //Text('tamaño: ${snapshot.data!.cuentasVista!.length}'),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: listaInversion!.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  Text('Cuenta Inversion:'),
                                  Text(listaInversion![index].numeroCuenta),
                                ],
                              );
                            })),
                  )
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
