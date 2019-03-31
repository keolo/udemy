import 'dart:async';
import 'validators.dart';

class Bloc with Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // Delegate for transformed email stream.
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);

  // Delegate for transformed password stream.
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);

  // Delegates for adding to streams.
  Function(String) get addEmail => _emailController.sink.add;
  Function(String) get addPassword => _passwordController.sink.add;

  // Clean up.
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

// Global instance of bloc.
final bloc = Bloc();
