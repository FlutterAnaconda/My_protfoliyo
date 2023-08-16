import 'package:flutter/Material.dart';

class Usertype with ChangeNotifier {
  bool? _isuser;
  bool? _isvendor;
  bool _islocationicon = true;
  bool get islocationicon => _islocationicon;
  bool? get isuser => _isuser;
  bool? get isvendor => _isvendor;
  void isUser(bool isuser) {
    _isuser = isuser;
    notifyListeners();
  }

  void isLocationIcon(bool islocationicon) {
    _islocationicon = islocationicon;
    notifyListeners();
  }
}
