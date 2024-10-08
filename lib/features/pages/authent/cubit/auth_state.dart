import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/models/user.dart';

part 'auth_state.g.dart';

enum AuthStatus { init, start, loading, success }

@CopyWith()
class AuthState extends Equatable {
  const AuthState(
      {this.listUsers = const [], this.user, this.status = AuthStatus.init});
  final List<User> listUsers;
  final User? user;
  final AuthStatus status;

  @override
  List<Object?> get props => [listUsers, user];
}
