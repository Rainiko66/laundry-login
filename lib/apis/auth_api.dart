
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:fpdart/fpdart.dart';
import 'package:laundry/core/core.dart';
import 'package:laundry/core/providers.dart';
import 'package:riverpod/riverpod.dart';
//signup, get user account -> Account
//access user related data -> model.User

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(account: account);
});

abstract class IAuthAPI {
  FutureEither<model.User> signUp({
    required String email,
    required String password,
  });

  FutureEither<model.Session> login({
    required String email,
    required String password,
  });
  Future<model.User?> currentUserAccount();
}
class AuthAPI implements IAuthAPI {
  final Account _account;
  //costructor _account
  AuthAPI({required Account account}): _account = account;

  @override
  Future<model.User ?> currentUserAccount() async{
    try {
      return await _account.get();

    } on AppwriteException  {
      return null;   
    } catch (e) {
      return null;

    }

    
  }

  @override
  FutureEither<model.User> signUp({
    required String email,
    required String password,
  })async{
    try {
      final account = await _account.create(userId: ID.unique(), email: email, password: password,);
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message??'Some unexpected error occurred', stackTrace),);
    }

    catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }    
    
  }
  
  @override
  FutureEither<model.Session> login({required String email, required String password}) async{
    try {
      final session =await _account.createEmailSession(email: email, password: password,);
      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message??'Some unexpected error occurred', stackTrace),);
    }

    catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }    
  }

}

