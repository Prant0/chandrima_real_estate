class Images {
  const Images._();

  static String get logo => 'app_logo'.jpg;
  static String get placeholder => 'placeholder'.jpg;
}


extension on String {
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get gif => 'assets/images/$this.gif';
}