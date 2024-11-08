class AppUrl {
  static const String baseUrl = 'http://157.245.109.206:8084';

  // Authentication API's
  static const String loginUrl = '$baseUrl/auth/seller-login';
  static const String registerUrl = '$baseUrl/auth/createAccount';
  static const String loginOtp = "$baseUrl/auth/verifyOtp";

  // KYC API's
  static const String aadharUpload = "$baseUrl/api/uploadAadhar";
  static const String bankDetails = "$baseUrl/api/uploadBankDetails";
  static const String uploadProfile = "$baseUrl/api/uploadProfile";
  static const String pancardUpload = "$baseUrl/api/uploadPancard";

  // sell veggies api
  static const String sellveggies = "$baseUrl/api/get/allProductData";
  static const String sellSubtypeveggies = "$baseUrl/api/get/allSubProductWithImage";
  static const String mandiPrice= "$baseUrl/mandiPrice/get-all-mandi/with-price";
  static const String sellHere = "$baseUrl/api/add/productForSell/placed";
  static const String orderPlaced = "$baseUrl/api/get/AllProductOfUserWhichPlaced";

  // Forgot Password Api's

  static const String forgotByEmail = "$baseUrl/auth/forgetByEmail";
  static const String forgotByMobile = "$baseUrl/auth/password-recovery-otp-with-mnumber";
  static const String verifyForgotOtp = "$baseUrl/auth/password-recovery-otp-veryfi";
  static const String resetPassword = "$baseUrl/auth/password-recovery-with-new-password";
}