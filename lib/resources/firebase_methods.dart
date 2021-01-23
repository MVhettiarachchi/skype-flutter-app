import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skype_app/model/user.dart';
import 'package:skype_app/utilize/utilze.dart';

class FirebaseMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final Firestore firestore =  Firestore.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  UserModel user =UserModel();

Future<FirebaseUser> getCurrentUser() async {
  FirebaseUser currentUser= await _auth.currentUser();
  return currentUser;
}

Future<FirebaseUser> signIn() async{
 
  GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
GoogleSignInAuthentication _signInAuthentication = await _signInAccount.authentication;

final AuthCredential credential = GoogleAuthProvider.getCredential(
  accessToken : _signInAuthentication.accessToken,
  idToken: _signInAuthentication.idToken
);
FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
 //User user = result.user;
return user;
}

Future<bool> authenticateUser(FirebaseUser user) async{
  QuerySnapshot result = await firestore
  .collection("user")
  .where("email",isEqualTo: user.email)
  .getDocuments();

  final List<DocumentSnapshot> docs = result.documents;
return docs.length == 0 ? true : false;
}

Future<void> addDataToDb(FirebaseUser currentUser)async{

  String username = Utils.getUsername(currentUser.email);
    user = UserModel(
    uid:currentUser.uid,
    email:currentUser.email,
    name:currentUser.displayName,
    username:username,
  );

firestore.collection("user").document(currentUser.uid).setData(user.toMap(user));

}

}

