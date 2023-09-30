import 'package:ecommercecourse/core/middleware/my_middleware.dart';
import 'package:ecommercecourse/view/screen/auth/forget_password.dart';
import 'package:ecommercecourse/view/screen/auth/login.dart';
import 'package:ecommercecourse/view/screen/auth/reset_password.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/success_reset_password.dart';
import 'package:ecommercecourse/view/screen/auth/success_signup.dart';
import 'package:ecommercecourse/view/screen/auth/verfiy_code.dart';
import 'package:ecommercecourse/view/screen/auth/verifycodesignup.dart';
import 'package:ecommercecourse/view/screen/items.dart';
import 'package:ecommercecourse/view/screen/my_favorite.dart';
import 'package:ecommercecourse/view/screen/pages_navbar/navbar_botton.dart';
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/onboarding.dart';
import 'package:ecommercecourse/view/screen/product_details.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  // this is the routes name
  static const String kOnboarding = '/Onboarding';
  static const String kLogin = '/login';
  static const String kSignup = '/signup';
  static const String kForgetPassword = '/forgetpassword';
  static const String kResetpassword = '/resetpassword';
  static const String kSuccessSignup = '/successSignup';
  static const String kSuccessResetPassword = '/successResetPassword';
  static const String kVerfiyCode = '/verfiyCode';
  static const String kVerfiyCodesignup = '/verfiyCodesignup';
  static const String knavbarButton = '/home';
  static const String kLanguage = '/';
  static const String kItems = '/items';
  static const String kProductDetails = '/productDetails';
  static const String kMyFavorite = '/MyFavorite';

  // this is the routes list
  static List<GetPage<dynamic>> getPages = [
    // GetPage(name: kLanguage, page: () => const TestVew()),
    GetPage(
        name: kLanguage,
        page: () => const Language(),
        middlewares: [MyMiddleware()]),
    GetPage(name: kOnboarding, page: () => const Onboarding()),
    GetPage(name: kLogin, page: () => const Login()),
    GetPage(name: kForgetPassword, page: () => const ForgetPassword()),
    GetPage(name: kResetpassword, page: () => const ResetPassword()),
    GetPage(name: kVerfiyCode, page: () => const VerifyCode()),
    GetPage(name: kSignup, page: () => const Signup()),
    GetPage(name: kSuccessSignup, page: () => const SuccessSignUp()),
    GetPage(name: kVerfiyCodesignup, page: () => VerifyCodeSignUp()),
    GetPage(
        name: kSuccessResetPassword, page: () => const SuccessResetPassword()),
    GetPage(name: knavbarButton, page: () => const NavbarButton()),
    GetPage(name: kItems, page: () => const Items()),
    GetPage(name: kProductDetails, page: () => const ProductDetails()),
    GetPage(name: kMyFavorite, page: () => const MyFavorite()),
  ];
}
