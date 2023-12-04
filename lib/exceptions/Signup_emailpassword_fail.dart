class SignUpWithEmailPasswordFailure {
  final String message;

  SignUpWithEmailPasswordFailure([this.message = "An Unknown error occurred."]);

  factory SignUpWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpWithEmailPasswordFailure('Enter a stronger password');
      case 'invalid-email':
        return SignUpWithEmailPasswordFailure('Email is not valid');
      case 'email-already-in-use':
        return SignUpWithEmailPasswordFailure(
            'An account already exists for that email');
      case 'operation-not-allowed':
        return SignUpWithEmailPasswordFailure('Operation is not allowed');
      case 'user-disable':
        return SignUpWithEmailPasswordFailure('This user has been disabled');
      default:
        return SignUpWithEmailPasswordFailure();
    }
  }
}
