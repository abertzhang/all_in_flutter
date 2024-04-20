//dart run ./lib/dart/main_list.dart

import 'package:collection/collection.dart';

void main() {
  listExpand();
  // listCommon();
  // listSort();
  // listReduce();
  // listFold();
  // listWhereType();
  // listCast();
}

///List 扩展函数
void listExpand() {
  Iterable<int> expandSingle(int n) sync* {
    yield n * n;
    // for (int i = 1; i < n; i++) {
    //   yield i * i;
    // }
  }

  Iterable<int> expandMore(int n) sync* {
    for (int i = 1; i < n; i++) {
      yield i * i;
    }
  }

  List<int> a = [0, 2];
  print('扩展函数--原数据:${a.toString()}');
  print('扩展函数--新数据--扩展单个:${a.expand(expandSingle).toList().toString()}');
  print('扩展函数--新数据--扩展多个:${a.expand(expandMore).toList().toString()}');
}

///List最大值和最小值
void listCommon() {
  List<int> nList = [0, 1, 2, 3, 4, 5, 6, 7];
  print('***************************');
  print('常用求值--原数据:${nList.toString()}');
  print('常用求值--最小值:${nList.min}');
  print('常用求值--最小值可空:${nList.minOrNull}');
  print('常用求值--最大值:${nList.max}');
  print('常用求值--最大值可空:${nList.maxOrNull}');
  print('常用求值--平均值:${nList.average}');
  print('常用求值--累加值:${nList.sum}');
  print('常用求值--反转值:${nList.reversed.toList()}');
  print('常用求值--去重值:${nList.toSet().toList()}');
  nList.shuffleRange(1, 3);
  print('常用求值--指定范围内随机排列:$nList');
  nList.shuffle(); //对自身操作
  print('常用求值--随机排列:$nList');
  print('常用求值--[index,value]:${nList.indexed.toList()}');
  print('常用求值--返回iterator:${nList.iterator.moveNext()}');
  // print('常用求值--iterator-当前值:${nList.iterator.current}');
  print('常用求值--返回NonNullsIterable<int>:${nList.nonNulls.toList()}');
  print('常用求值--拼接:${nList.join(';')}');
  print('**常用求值--List_none:${nList.none((p0) {
    print(p0);
    return true;
  })}');
}

///ListSort
/*
sort()
sortBy()
sortByCompare
sortRange()
sorted()
sortedBy()
sortedByCompare
*/
void listSort() {
  List<int> nList = [2, 3, 4, 0, 1, 5, 6, 7];
  nList.sort(); //对自身操作
  print('默认升序$nList');
  nList.shuffle(); //对自身操作--随机排列
  // nList.sort((a, b) => max(a, b));//这个不能降序
  nList.sort((a, b) => a > b ? 1 : -1); //升序--方式1
  print('升序排列$nList');
  nList.shuffle(); //对自身操作--随机排列
  nList.sort((a, b) => b.compareTo(a)); //降序
  print('降序排列$nList');
  print('compare:${1.compareTo(2)}'); //-1
  print('***************************');
  var xList = [100, 99, 555, 3, 4, 1, 7, 2];
  xList.sortRange(0, 4, (a, b) => a.compareTo(b));
  print('序号0-3的元素升序$xList');
  xList.shuffle();
  List<int> result = xList.sorted((a, b) => a > b ? 1 : -1); //与sort区别,sorted返回值
  print('sorted排序后:$result');
  nList.sortBy<String>((e) {
    print('sorted--:$e');
    return e.toString();
  });
  print('sortBy:${nList.toString()}');
}

///reduce--对各元素统累计计算
///reduce(),reduce()
void listReduce() {
  List<int> nList = [2, 3, 4, 1, 0, 5, 6, 7];
  print('原数据:$nList');
  int sum = nList.reduce((value, element) {
    print('value:$value,element:$element');
    if (value == 3) {
      return value + element;
    } else {
      return value + element;
    }
  });
  print('reduce求和:$sum');
  //previous和上面的value都是存放累计值
  int result = nList.reduceIndexed((index, previous, element) {
    print('index:$index,previous:$previous,element:$element');
    return previous + element;
  });
  print('reduceIndexed求和:$result');
}

///fold
///fold(),fold(),fold()
void listFold() {
  List<int> nList = [2, 3, 4, 1, 0, 5, 6, 7];
  print('原数据:$nList');
  int result = nList.fold<int>(10000, (previousValue, element) {
    print('previousValue:$previousValue,element:$previousValue');
    return previousValue + element;
  });
  print('fold:$result');
  result = nList.foldIndexed(10000, (index, previous, element) => element + previous);
  print('foldIndexed:$result');
}

///skip和take,take取符第一个合条件的前面元素,skip取第一个符合条件的后面元素
///skip(),skipWhile(),take(),takeWhile()
void listTakeSkip() {}

///whereType
void listWhereType() {
  List<dynamic> l1 = [
    "a",
    15,
    "b",
    false,
    true,
    20,
    "c",
    {"name": "AllenSu"}
  ];
  Iterable<String> l2 = l1.whereType();
  Iterable<int> l3 = l1.whereType();
  Iterable<bool> l4 = l1.whereType();
  Iterable<Map> l5 = l1.whereType();
  print(l2); // (a, b, c)
  print(l3); // (15, 20)
  print(l4); // (false, true)
  print(l5); // ({name: AllenSu})
}

///cast,将一个数组的类型传递给未指定数据类型的数组
void listCast() {
  List<int> l1 = [8, 12, 8];
  var l2 = l1.cast(); // 指定 l2 的数据类型和 l1 的一样，都是 int 类型
  l2.add(6);
  print(l1); // [8, 12, 8, 6]
  // l2.add("ddd");
  // print(l1); // 报错，提示无法将 String 类型的数添加到 int 类型的数组中
  List<dynamic> dynamicList = [
    "a",
    15,
    "b",
    false,
    true,
    20,
    "c",
    {"name": "AllenSu"}
  ];
  var l3 = dynamicList.cast();
  print(l3.runtimeType);
}
