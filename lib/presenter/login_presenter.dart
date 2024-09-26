import '../view/login_view.dart';

class LoginPresenter {
  final LoginViewContract view;

  LoginPresenter(this.view);

  void login(String username, String password) {
    // Simulação de verificação de login
    if (username == 'admin' && password == '1234') {
      view.onLoginSuccess();
    } else {
      view.onLoginError("Credenciais Inválidas");
    }

  }
}
