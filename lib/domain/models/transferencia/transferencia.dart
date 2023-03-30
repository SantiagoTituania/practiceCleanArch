class Transferencia {
  Transferencia({
    required this.numeroCuentaOrigen,
    required this.numeroCuentaDestino,
    required this.motivo,
    required this.fecha,
    required this.monto,
    required this.idUsuario,
    required this.idCuentaVista,
    required this.idCuentaDestino,
  });

  late final String numeroCuentaOrigen;
  late final String numeroCuentaDestino;
  late final String motivo;
  late final String fecha;
  late final String monto;
  late final int idUsuario;
  late final int idCuentaVista;
  late final int idCuentaDestino;

  Transferencia.fromJson(Map<String, dynamic> json) {
    numeroCuentaOrigen = json['numeroCuentaOrigen'];
    numeroCuentaDestino = json['numeroCuentaDestino'];
    motivo = json['motivo'];
    fecha = json['fecha'];
    monto = json['monto'];
    idUsuario = json['id_usuario'];
    idCuentaVista = json['id_cuenta_vista'];
    idCuentaDestino = json['idCuentaDestino'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['numeroCuentaOrigen'] = numeroCuentaOrigen;
    _data['numeroCuentaDestino'] = numeroCuentaDestino;
    _data['motivo'] = motivo;
    _data['fecha'] = fecha;
    _data['monto'] = monto;
    _data['id_usuario'] = idUsuario;
    _data['id_cuenta_vista'] = idCuentaVista;
    _data['idCuentaDestino'] = idCuentaDestino;

    return _data;
  }
}
