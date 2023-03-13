part of 'credential_auth_cubit.dart';

@immutable
abstract class CredentialAuthState extends Equatable {
  const CredentialAuthState();
}

class CredentialAuthInitial extends CredentialAuthState {
  @override
  List<Object> get props => [];
}

class CredentialAuthSuccess extends CredentialAuthState {
  @override
  List<Object> get props => [];
}

class CredentialAuthFailure extends CredentialAuthState {
  @override
  List<Object> get props => [];
}

class CredentialAuthLoading extends CredentialAuthState {
  @override
  List<Object> get props => [];
}

