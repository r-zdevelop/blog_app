import 'package:blog_app/core/usecases/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/profile.dart';
import 'package:blog_app/features/auth/domain/usecases/current_user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_login.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
  }) : _userSignUp = userSignUp,
       _userLogin = userLogin,
       _currentUser = currentUser,
       super(AuthInitial()) {
    on<AuthSignUpEvent>(_onAuthSignUpEvent);
    on<AuthLoginEvent>(_onAuthLoginEvent);
    on<AuthIsUserLoggedInEvent>(_isUserLoggedIn);
  }

  void _isUserLoggedIn(
    AuthIsUserLoggedInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (profile) => emit(AuthSuccess(profile)),
    );
  }

  void _onAuthSignUpEvent(
    AuthSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final res = await _userSignUp(
      UserSignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (profile) => emit(AuthSuccess(profile)),
    );
  }

  void _onAuthLoginEvent(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userLogin(
      UserLoginParams(email: event.email, password: event.password),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (profile) => emit(AuthSuccess(profile)),
    );
  }
}
