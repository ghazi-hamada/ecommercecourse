class AppLink {
  //======================server======================
  static const String server = 'https://appghazi.tech/ecommerce';

  //======================image======================
  static const String imageStatic = 'https://appghazi.tech/ecommerce/upload';
  static const String imagecategories = '$imageStatic/categories';
  static const String imageItems = '$imageStatic/items';

  //======================test======================
  static const String test = '$server/test.php';

  // ======================auth======================
  static const String signup = '$server/auth/signup.php';
  static const String login = '$server/auth/login.php';
  static const String verfiycodeSignup = '$server/auth/verfiycode.php';

  //======================forget password======================
  static const String checkEmail = '$server/forgetpassword/checkemail.php';
  static const String resetPassword =
      '$server/forgetpassword/resetpassword.php';
  static const String verfiyCodeForgetPassword =
      '$server/forgetpassword/verifycode.php';

  //======================Home=================================
  static const String homepage = '$server/home.php';
  static const String items = '$server/items/items.php';

  //======================favorite=================================
  static const String favoriteAdd = '$server/favorite/add.php';
  static const String favoriteRemove = '$server/favorite/remove.php';
  static const String favoriteView = '$server/favorite/view.php';
  static const String deletefromfavorite = '$server/favorite/deletefromfavorite.php';
}
