import 'package:get/get.dart';

class ValidatorHelper {

  static String? validMobile(String value) {
    if(!GetUtils.isPhoneNumber(value)) {
      return 'شماره موبایل معتبر وارد کنید';
    }
    return null;
  }

  static String? validPhoneNumber(String value) {
    final regexPhoneNumber = RegExp(r'^0[0-9]{2,}[0-9]{7,}$');
    if(!regexPhoneNumber.hasMatch(value)) {
      return 'شماره تلفن معتبر وارد کنید';
    }
    return null;
  }

  static String? requireValid(String value) {
    if(value.isEmpty) {
      return 'لطفا فیلد مربوطه را تکمیل کنید';
    }
    return null;
  }

  static String? validMelliCode(String value) {
    if (!RegExp("^\\d{10}").hasMatch(value)) {
      return 'کد ملی صحیح نیست';
    }
    final check = int.parse(value[9]);
    final sum = Iterable<int>.generate(9).map((x) => int.parse(value[x]) * (10 - x)).reduce((x, y) => x + y) % 11;
    return !(sum < 2 ? check == sum : check + sum == 11) ? 'کد ملی صحیح نیست' : null;
  }
}