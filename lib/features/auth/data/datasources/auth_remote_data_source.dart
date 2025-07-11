import 'package:blog_app/core/errors/exceptions.dart';
import 'package:blog_app/features/auth/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currenstUserSession;
  Future<ProfileModel> signUpWithEmailAndPassword(
    String name,
    String email,
    String password,
  );
  Future<ProfileModel> loginWithEmailAndPassword(String email, String password);
  Future<ProfileModel?> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currenstUserSession => supabaseClient.auth.currentSession;

  @override
  Future<ProfileModel?> getCurrentUserData() async {
    try {
      if (currenstUserSession != null) {
        final userData = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currenstUserSession!.user.id)
            .single();
        return ProfileModel.fromJson(
          userData,
        ).copyWith(email: currenstUserSession!.user.email);
      }

      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ProfileModel> signUpWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      if (response.user == null) {
        throw ServerException('User is null!');
      }
      return ProfileModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ProfileModel> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw ServerException('User is null!');
      }
      return ProfileModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
