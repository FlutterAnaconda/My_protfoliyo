import 'package:flutter/Material.dart';

class Usertype with ChangeNotifier {
  bool? _isuser;
  bool? _subscribe =false;
  int? _baseindex=-1;
  bool _islocationicon = true;
  bool get islocationicon => _islocationicon;
  bool? get isuser => _isuser;
  bool? get subscribe => _subscribe;
  int? get baseindex => _baseindex;
  void isUser(bool isuser) {
    _isuser = isuser;
    notifyListeners();
  }
  void subscription(bool subscribe) {
    _subscribe = subscribe;
    notifyListeners();
  }
  void choosebase(int index) {
    _baseindex = index;
    notifyListeners();
  }
  void isLocationIcon(bool islocationicon) {
    _islocationicon = islocationicon;
    notifyListeners();
  }
}
