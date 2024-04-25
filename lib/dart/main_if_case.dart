void main() {
  var aList = [1, 2];
  if (aList case List(length: 2)) {
    print("数组是整形，长度为2");
  }
  if (aList case [int x, int y] when (x > 0 && y > 1)) {
    print("数组是整形，长度为2,元素大于0");
  }
  var bList = List.filled(20, 3);
  //只要getter都能用length，isEmpty等
  if (bList case List(length: 20) when (bList.every((e) => e > 1))) {
    print("数组是整形，长度为20,大于1");
  }
}

///
void checkTypeA(dynamic value) {
  if (value case List(length: 20) when value.every((e) => e > 0)) {
    print('长度20，大于0');
  } else if (value case Item(:final id) when id.isNotEmpty) {
    print('type is Item ,and not empty');
  }
  //
  switch (value) {
    case List(length: 20, :final first, :final last) when first == last:
      print('首尾相等');
    case Item(:final id) when id.isNotEmpty:
      print('Item类');
      _:
      print('sdf');
  }
  //
  String result = switch (value) {
    List(length: 20, :final first) when first > 0 => '',
    Item(:final id) when id.isNotEmpty => 'Item',
    String str when str.isNotEmpty => 'str is not empty',
    _ => '',
  };
  print(result);
}

class Item {
  String _id;
  Item._(this._id);
  factory Item.from(String id) => Item._(id);
  String get id => _id;
  set id(String value) {
    if (value != _id) {
      _id = value;
    }
  }
}
