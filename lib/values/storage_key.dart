// class StorageKey {
//   static const token = 'user_token'; //value类型String
//   static const userInfo = 'user_info'; //value类型String
//   static const isFirstLogin = 'first_login'; //value类型bool
//   static const lastLogin = 'last_login'; //value类型int,日期值
//   static const lastLogout = 'last_logout'; //value类型int,日期值
//   static const lastDuration = 'last_duration'; //value类型int
// }

enum StorageKey {
  token('user_token'), //value类型String
  userInfo('user_info'), //value类型String
  isFirstLogin('first_login'), //value类型bool
  lastLoginDate('last_login_date'), //value类型int,日期值
  lastLogoutDate('last_logout_date'), //value类型int,日期值
  lastDuration('last_duration'); //value类型int

  final String key;
  const StorageKey(this.key);
}
