import 'package:get/get_navigation/src/root/internacionalization.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Email',
           'password_hint': 'Password',
          'internet_exception':
              'Please check your internet connection \n Try again!',
          'general_exception': 'We could processed your request \n Try again!',
          'welcome_back': 'Welcome \n Back',
          'login': 'Login'
        },
        'BN_BD': {'email_hint': 'ই-মেইল'}
      };
}
