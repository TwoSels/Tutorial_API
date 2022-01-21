import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class GoogleSignInController with ChangeNotifier {
  //object
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  //fungsi untuk login
  login() async {
    this.googleSignInAccount = await _googleSignIn.signIn();

    //panggil
    notifyListeners();
  }

  // fungis untuk logout
  logout() async {
    //nilai kosong setelah logout
    this.googleSignInAccount = await _googleSignIn.signOut();

    //panggil
    notifyListeners();
  }
}
