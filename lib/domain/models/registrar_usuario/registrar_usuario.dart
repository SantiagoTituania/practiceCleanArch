class RegistrarUsuario {
  RegistrarUsuario({
    //required this.idUsuario,
    required this.cedulaUsuario,
    required this.telefonoUsuario,
    required this.emailUsuario,
    required this.password,
  });
  //late final int idUsuario;
  late final String cedulaUsuario;
  late final String telefonoUsuario;
  late final String emailUsuario;
  late final String password;

  RegistrarUsuario.fromJson(Map<String, dynamic> json) {
    //idUsuario = json['id_usuario'];
    cedulaUsuario = json['cedula_usuario'];
    telefonoUsuario = json['telefono_usuario'];
    emailUsuario = json['email_usuario'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['id_usuario'] = idUsuario;
    _data['cedula_usuario'] = cedulaUsuario;
    _data['telefono_usuario'] = telefonoUsuario;
    _data['email_usuario'] = emailUsuario;
    _data['password'] = password;
    return _data;
  }
}
