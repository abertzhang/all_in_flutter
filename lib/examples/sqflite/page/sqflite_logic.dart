import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../bean/favorite.dart';
import '../bean/shoe.dart';
import '../bean/user.dart';
import '../util/sqflite_db_util.dart';

class SqfliteLogic extends GetxController {
  //
  bool isLoading = true;
  List<User> userList = [];

  @override
  void onReady() async {
    await getAllUser();
    isLoading = false;
    update();
  }

  //----------------------------user--------------------------------
  //新增user
  Future<void> addUser() async {
    User user = User(account: 'z@126.com', pwd: '12432', name: 'hua');
    await SqfliteDBUtil().insertUser(user);
    await getAllUser();
    update();
  }

  //删除某条user
  Future<void> delUser({required int id}) async {
    await SqfliteDBUtil().delUserById(id);
    await getAllUser();
    update();
  }

  //删除所有user
  Future<void> delAllUser() async {
    await SqfliteDBUtil().delAllUser();
    await getAllUser();
    update();
  }

  //查询所有user
  Future<void> getAllUser() async {
    userList = await SqfliteDBUtil().queryAllUser();
  }

  //----------------------------shoe--------------------------------
  List<Shoe> shoeList = [];
  //新增shoe
  Future<void> addShoe() async {
    Shoe shoe = Shoe(name: '百里', price: 199.85, category: '女');
    await SqfliteDBUtil().insertShoe(shoe);
    await getAllShoe();
    LogUtil.v(shoeList.first.toMap());
    update();
  }

  //查询所有shoe
  Future<void> getAllShoe() async {
    shoeList = await SqfliteDBUtil().queryAllShoe();
  }

  //----------------------------shoe--------------------------------
  List<Favorite> favoriteList = [];
  //新增记录
  Future<void> addFavorite() async {
    Favorite favorite = Favorite(userId: 18, shoeId: 1);
    await SqfliteDBUtil().insertFavorite(favorite);
    await getAllFavorite();
    LogUtil.v(favoriteList.first.toMap());
    update();
  }

  //查询所有shoe
  Future<void> getAllFavorite() async {
    favoriteList = await SqfliteDBUtil().queryAllFavorite();
  }
}
