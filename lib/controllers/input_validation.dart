String validateUsername(String value) {
  if (value.isEmpty) {
    return 'Ingresa tu nombre de usuario';
  } else {
    return null;
  }
}

String validatePassword(String value) {
  if (value.length < 8) {
    return 'La contraseña debe de contener hasta 8 caracteres.';
  } else
    return null;
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Ingresa un correo válido';
  else
    return null;
}
