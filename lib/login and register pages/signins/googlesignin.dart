import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//google sign in

class authenticate {
  signInWithGoogle() async {
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gauth = await guser!.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: gauth.idToken,
      accessToken: gauth.accessToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
