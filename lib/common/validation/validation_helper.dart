import '../../generated/l10n.dart';

class ValidationHelper {
  static String? isNullOrEmpty(String? source) {
    if (source != null && source.isNotEmpty) {
      return null;
    }
    return S.current.fieldNRequired('');
  }

  static String? email(String? source) {
    if (source == null || source.isEmpty) {
      return S.current.fieldNRequired('');
    }

    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(source);
    if (!emailValid) {
      return S.current.notCorrectEmail;
    }
    return null;
  }
}
