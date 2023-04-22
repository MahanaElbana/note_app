import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:star/core/error/failure.dart';
import 'package:star/model/user_model.dart';
import 'package:dartz/dartz.dart';

class FirebaseAuthDataSource {
  /// =============== Function of signing up ======================//
  static Future<Either<Failure, Enum>> signUp({
    required String userName,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential _userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String userId = _userCredential.user!.uid;

      UserModel userModel = UserModel(
        id: userId,
        userName: userName.trim().toLowerCase(),
        password: password.trim(),
        phone: phone.trim(),
        email: email.trim().toLowerCase(),
      );

      var returnedData = await FirebaseFirestore.instance
          .collection("user")
          .doc(userId)
          .set(userModel.toJsonData())
          .then((value) => UserAuthenticationStatus.isAuthenticated);

      //====== return the right
      return right(returnedData);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseExceptionMasseges.emailAlreadyInUse) {
        return left(
          FirebaseFailure(message: e.code),
        );
      } else if (e.code == FirebaseExceptionMasseges.weakPassword) {
        return left(
          FirebaseFailure(message: e.code),
        );
      } else if (e.code == FirebaseExceptionMasseges.invalidEmail) {
        return left(
          FirebaseFailure(message: e.code),
        );
      }
      return left(FirebaseFailure(message: e.code));
    } catch (error) {
      //====== return the left
      return left(FirebaseFailure(message: error.toString()));
    }
  }

  /// ========= Sign Out =================///
  static Future<void> Logout() async {
    await FirebaseAuth.instance.signOut();
  }
}

enum UserAuthenticationStatus {
  isAuthenticatedAndEmailVerified,
  isAuthenticated,
  isNotAuthenticated
}

class FirebaseExceptionMasseges {
  static const String emailAlreadyInUse = "email-already-in-use";
  static const String weakPassword = "weak-password";
  static const String invalidEmail = "invalid-email";
}
