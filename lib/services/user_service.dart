import 'rest.dart';
import '../models/user.dart';

class UserService {
  static Future<User> getUserByLoginAndPassword(
      {String login, String password}) async {
    final List json = await Rest.get('users?login=$login&&password=$password');
    print(json);
    if (json == null || json.length == 0) return null;
    final _user = User.fromJson(json[0]);
    return _user;
  }
}
