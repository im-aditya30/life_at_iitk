import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/auth/user.dart' as us;

extension FIrebaseUserX on User {
  us.User toUserType() => us.User(
      uid: uid,
      id: email!.replaceAll("@iitk.ac.in", ""),
      isEmailVerified: emailVerified);
}
