class AppConstants  {
  static const String appName = 'Chandrima Real Estate';
  static const double appVersion = 1.0;

  static const String baseUrl = 'https://app.chandrimarpl.com/api';

  static const String loginUri = '/login';
  static const String logoutUri = '/member/logout';
  static const String memberDetailsUri = '/member/details';
  static const String addFamilyMember = '/member/family/store';
  static const String addTenantMember = '/member/tenant/store';
  static const String userInvoiceList = '/invoice/list';
  static const String advertisementList = '/advertises';
  static const String notificationsList = '/notifications';
  static const String advertisementDetails = '/advertise/details';
  static const String complainList = '/complaints';
  static const String addComplain = '/complaint/store';
  static const String complainCategoryList = '/complaint/categories';

  /// Gate Pass
  static const String gatePassList = '/gate-pass/list';
  static const String gatePassType = '/gate-pass/create';
  static const String addGatePass = '/gate-pass/store';
  static const String deleteGatePass = '/gate-pass/delete';
  static const String gatePassDownload = '/gate-pass/download';

  static const String token = 'chandrima_token';
}