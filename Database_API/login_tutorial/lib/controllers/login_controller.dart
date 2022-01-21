import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_tutorial/model/user_detail.dart';

class LoginController with ChangeNotifier {
  //object
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetails? userDetails;

  //fungsi untuk login google
  googleLogin() async {
    this.googleSignInAccount = await _googleSignIn.signIn();
    // memasukkan nilai pada user detail model

    this.userDetails = new UserDetails(
      displayName: this.googleSignInAccount!.displayName,
      email: this.googleSignInAccount!.email,
      photoURL: this.googleSignInAccount!.photoUrl,
    );

    //panggil
    notifyListeners();
  }

  //logout
  logout() async {
    this.googleSignInAccount = await _googleSignIn.signOut();
    //await FacebookAuth.i.logOut();
    userDetails = null;
    notifyListeners();
  }
}
