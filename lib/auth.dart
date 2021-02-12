import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

// this declare a asycnchorize function meaning that the app will not stop working or it will not wait to get the value from the user
Future<FirebaseUser> signInwithuser() async {
  // google reltaed stuff
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  // our firebase section
  final AuthResult authResult = await _auth.signInWithCredential(credential);

  final FirebaseUser user = authResult.user;
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  // to check whether the login user is same as signined user
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);

  return user;
}

void Signout() async {
  await googleSignIn.signOut();
}

Future getCurrentUser() async {
FirebaseUser _user = await FirebaseAuth.instance.currentUser();
print("User: ${_user.displayName ?? "None"}");
return _user;}