import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/failure.dart';
import 'package:flutter_app/repository/main_repository.dart';
import 'package:oktoast/oktoast.dart';

class MainViewmodel extends ChangeNotifier {
  TextEditingController longUrlController = TextEditingController();
  TextEditingController shorUrlController = TextEditingController();

  MainRepository _repository = MainRepository();

  bool _isLoading = false;
  String shortUrl = 'n/a';
  String longUrl = 'n/a';

  set loading(bool flag) {
    _isLoading = flag;
    notifyListeners();
  }

  bool get loading => _isLoading;

  ///generate shortlink
  ///
  ///
  Future<void> generateShortUrl() async {
    loading = true;

    try{
      shortUrl =
      await _repository.generateShortUrl(longUrlController.text,'');
      print(shortUrl);
    }catch (e){
      showToast(e.toString());
    }

    loading = false;
  }

  ///generate longlink
  ///
  ///
  Future<void> generateLongUrl() async {
    loading = true;

    try{
      longUrl =
      await _repository.generateLongUrl(shorUrlController.text);
    }catch (e){
      showToast(e.toString());
    }

    loading = false;
  }

  ///dispose object
  ///
  ///
  @override
  void dispose() {
    longUrlController.dispose();
    super.dispose();
  }
}
