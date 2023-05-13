import 'dart:io';

checkInternet() async {
  var result = await InternetAddress.lookup('google.com');
  try {
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (e) {
    print(e);
    return false;
  }
}
