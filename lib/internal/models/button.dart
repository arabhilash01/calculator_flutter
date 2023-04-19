// ignore_for_file: public_member_api_docs, sort_constructors_first
class Buttons {
  String name;
  ButtonType type;
  Buttons({
    required this.name,
    this.type = ButtonType.normal,
  });
}

enum ButtonType { special, operators, normal }
