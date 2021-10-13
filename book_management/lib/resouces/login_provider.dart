class LoginProvider {
  Future<void> login(String username, String password) async {
    print('login $username, $password');
    //gọi api
    Future.delayed(Duration(seconds: 5));
    print('logged in');

  }
}