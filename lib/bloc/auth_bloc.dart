import 'package:bloc/bloc.dart';
import 'package:smart_farm/authentication/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }
}

Future<void> _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final FirebaseAuthService authService = FirebaseAuthService();
      final uid = await authService.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
      );
      if(uid != null) {
        emit(AuthSuccess(uid: uid));
      } else {
        emit(AuthFailure('Authentication failed'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final FirebaseAuthService authService = FirebaseAuthService();
      await authService.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
