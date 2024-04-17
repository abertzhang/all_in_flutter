/*
dart ./lib/dart/main_list.dart
*/

void main() {
  List a = [1, 2, 3];
  // print(a.reversed.toString()); //返回值是反转后
  // print(a.firstOrNull);
  // print(a.indexed); //[[0,1],[1,2],[2,3]]
  // print(a.iterator.moveNext());
  // // print([2, 6].iterator.current);
  // // a.cast();
  // // print(a.expand((e) => e * 3).toList());
  // // print(a.fold(initialValue, (previousValue, element) => null))
  print(a.followedBy([5, 9]));

  // a.reduce((value, element) => null);
  a.retainWhere((element) => element > 2);
  // a.print(a);
}
