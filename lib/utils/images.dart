class Images {
  const Images._();

  static String get logo => 'app_logo'.jpg;
  static String get placeholder => 'placeholder'.jpg;
  static String get invoice => 'invoice'.jpeg;
  static String get complaign => 'complaign'.jpeg;
  static String get notification => 'invoice'.jpeg;
  static String get gate_pass => 'gate_pass'.jpeg;
  static String get payment => 'payment'.jpeg;
  static String get land_info => 'land_info'.jpeg;
  static String get family => 'family'.jpeg;
  static String get event => 'event'.jpeg;
  static String get post => 'post'.png;
  static String get vote => 'vote'.png;
  static String get news => 'news'.png;
  static String get service => 'service'.png;
  static String get helpline => 'helpline'.png;
  static String get ads => 'ads'.png;

}


extension on String {
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get jpeg => 'assets/images/$this.jpeg';
  String get gif => 'assets/images/$this.gif';
}