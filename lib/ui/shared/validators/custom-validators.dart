class CustomValidators {
  static isEmail(String value) {
    RegExp regex =
        new RegExp(r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");
    print(regex.hasMatch(value).toString());

    if (value.isEmpty) {
      return 'E-mail inválido';
    }
    return null;
  }
}
