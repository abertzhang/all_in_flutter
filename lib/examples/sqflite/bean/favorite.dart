import 'shoe.dart';
import 'user.dart';

class Favorite {
  int? id;
  int? date;
  int? userId;
  int? shoeId;
  User? user;
  Shoe? shoe;

  Favorite({
    this.id,
    this.date,
    this.userId,
    this.shoeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'userId': userId,
      'shoeId': shoeId,
    };
  }

  factory Favorite.fromMap(dynamic map) {
    if (null == map) return Favorite();
    var temp;
    return Favorite(
      id: null == (temp = map['id']) ? null : (temp is num ? temp.toInt() : int.tryParse(temp)),
      date: null == (temp = map['date']) ? null : (temp is num ? temp.toInt() : int.tryParse(temp)),
      userId: null == (temp = map['userId']) ? null : (temp is num ? temp.toInt() : int.tryParse(temp)),
      shoeId: null == (temp = map['shoeId']) ? null : (temp is num ? temp.toInt() : int.tryParse(temp)),
    );
  }
}
