继承TextInputFormatter实现带分隔符输入

<img src="http://qiniu-article.myflutter.cn/img/cover_car_02.jpg" style="zoom: 67%;" />

在手机app开发经常用到手机号、身份证号、银行卡号等长串字符的输入，为增加客户体验感，往往对输入字符作分割，官方提供的类FilteringTextInputFormatter和LengthLimitingTextInputFormatter不能完美满足需求，对抽象类TextInputFormatter继承后自定义个性化的输入格式类。

![](http://qiniu-article.myflutter.cn/img/divider_formatter_01.gif)

​		涉及到知识点有以下：

- 抽象类TextInputFormatter
- 类TextEditingValue
- 正则类RegExp
- 类TextRange和类TextSelection
- 类TextPosition
- 枚举TextAffinity

​		复写抽象类TextInputFormatter的方法formatEditUpdate即可实现继承，方法的定义中有两个参数，返回TextEditingValue。

```dart
//需要override,这是重点
formatEditUpdate(
	TextEditingValue oldValue, 
	TextEditingValue newValue
) → TextEditingValue
```

​		TextInputFormatter有两个子类是FilteringTextInputFormatter和LengthLimitingTextInputFormatter，在常规需求结合正则基本满足需求，用法不在这里赘述，抽象类还有一个静态方法withFunction，其定义：

```dart
withFunction(
TextInputFormatFunction formatFunction
) → TextInputFormatter
//预定义TextInputFormatFunction
TextInputFormatFunction = TextEditingValue Function(
TextEditingValue oldValue,
TextEditingValue newValue
)  
```

也可以用类的静态方法直接返回TextEditingValue，为后期使用，并且可以方便收录到自己的库中管理，这里使用继承的方式写个自定义类DividerInputFormatter，分隔符默认空白符。

​		输入格式的自定义关键类是TextEditingValue，其构造函数

```dart
TextEditingValue({
String text: '',
//显示的文本
TextSelection selection: const TextSelection.collapsed(offset: -1),
//选中的范围,collapsed为开始和结束一致是无选中的,即光标位置,-1和0是最左侧位置
TextRange composing: TextRange.empty
//范围会有一条下划线,如TextRange(start: 8, end: 16)
})
```

类TextRange和TextSelection是父子关系，可以简单看一下构造函数

```dart
//TextRange构造
TextRange({required int start, required int end})
//没有范围选中,开始和结束一致,光标的位置
TextRange.collapsed(int offset)
//常规方法
textAfter(String text) → String
textBefore(String text) → String
textInside(String text) → String
```

```dart
TextSelection({
	required int baseOffset, //开始位置
	required int extentOffset, //结束位置
	TextAffinity affinity = TextAffinity.downstream, 
	bool isDirectional = false
	//是否消除了其基础和范围的歧义
})

/*
TextSelection.fromPosition是把TextSelection对象
的 extentOffset 和 baseOffset赋值给了同一个数，
而TextSelection.collapsed又是TextSelection.fromPosition
的简化版
*/
TextSelection.collapsed({
	required int offset, 
	TextAffinity affinity = TextAffinity.downstream
})
//光标移动到第几位,-1或0为第一个
TextSelection.fromPosition(TextPosition position)
//
TextPosition({
	required int offset, 
	//枚举TextAffinity,换行后光标在上还是下
	TextAffinity affinity = TextAffinity.downstream
})
```

​		对上面的涉及到类能看明白理解作用，就开始进入正式话题，需求是输入自动分割，默认空白符，分隔符是短线，输入后界面显示：135-1234-1234，随着字数增加光标位置受到影响，可以分为两种情况来分析，第一种光标在最右侧也就是文本尾部，这是常见的情况，那么只要对override方法formatEditUpdate的入参newValue.text作分隔符的适当位置插入，光标始终在text.length的位置，返回对应TextEditingValue

```dart
///光标在文字最右侧(尾部)的情况,光标始终在最后
if (cursorPosition >= newValue.text.length) {
  return TextEditingValue(
    text: allTextDeal,//文本带分隔符
    selection: TextSelection.collapsed(offset: allTextDeal.length),
    //光标在最右侧
  );
}
```

另一种情况，文本框现在是：136-1234-1，光标在4后面的位置cursorPosition=8，随即输入5，文本框显示136-12345-1，光标在5后面cursorPosition=9，Flutter给你的newValue值里text为136-12345-1，newValue.selection.baseOffset（光标位置）为9，当你拿到newValue处理完新文本应该是136-1234-51，原来光标位置被新增的分隔符占位，光标应该在5后面，因此cursorPosition++为光标新位置值。

![](http://qiniu-article.myflutter.cn/img/divider_formatter_02.gif)

![](http://qiniu-article.myflutter.cn/img/divider_formatter_03.jpeg)

​		光标不在最右侧时输入，增加的一个字符是在左侧，Flutter给的参数newValue的是新增后的光标位置，所有不用额外加光标位置值cursorPosition，只有一种特殊情况光标左侧文本（相对原来带分隔符的文本）会增加一个分隔符，而且新增的分隔符位置必定在cursorPosition位置上，因此需要判断带分隔符的新文本在cursorPosition位置上的字符是否等于分隔符，如果是则光标后移一位cursorPosition++，代码如下

```dart
///光标不在文字尾部的情况
//如果原光标位置变为分割符,则说明左侧增加一位,光标也加一位
if (allTextDeal.substring(cursorPosition - 1, cursorPosition) == pattern) {
  cursorPosition++;
}
return TextEditingValue(
  text: allTextDeal,
  selection: TextSelection.collapsed(offset: cursorPosition),
);
```

​		根据思路撸代码，落笔较匆忙，代码也较随意，类名没有完全按照官方命名规则，嫌名字太长。如有错误还请斧正，自定义类DividerInputFormatter代码：

```dart
/*
 * create by 行云流水
 * 空格符--RegExp(r'\s')
 * 注意点--需要对分隔符允许输入
 * 注意点--后期对文本内容清除分隔符
 * 官方类--LengthLimitingTextInputFormatter,FilteringTextInputFormatter
 * 只允许数字和X和x和空格--FilteringTextInputFormatter.allow(RegExp(r'[0-9Xx\s]')),
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(home: DividerFormatterPage()));

class DividerFormatterPage extends StatelessWidget {
  const DividerFormatterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(body: _buildBody());

  _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 100),
      child: TextField(
        inputFormatters: [
          DividerInputFormatter(pattern: '-'),
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\s\-]')),
          LengthLimitingTextInputFormatter(13),
        ],
      ),
    );
  }
}

class DividerInputFormatter extends TextInputFormatter {
  final int first, rear; //第一个分割位数,后面分割位,,数
  final String pattern; //分割符

  DividerInputFormatter({this.first = 3, this.rear = 4, this.pattern = ' '});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    //不含分隔符的文本
    String allTextPure = newValue.text.replaceAll(RegExp(pattern), '');
    //处理后含分隔符的文本
    String allTextDeal = '';
    //光标位置
    int cursorPosition = newValue.selection.baseOffset;
    for (int i = 0; i < allTextPure.length; i++) {
      if ((i == first || (i - first) % rear == 0) && allTextPure[i] != pattern) {
        allTextDeal = '$allTextDeal$pattern';
      }
      allTextDeal += allTextPure[i];
    }

    ///光标在文字最右侧(尾部)的情况,光标始终在最后
    if (cursorPosition >= newValue.text.length) {
      return TextEditingValue(
        text: allTextDeal,
        selection: TextSelection.collapsed(offset: allTextDeal.length),
      );
    }

    ///光标不在文字尾部的情况
    //如果原光标位置变为分割符,则说明左侧增加一位,光标也加一位
    if (allTextDeal.substring(cursorPosition - 1, cursorPosition) == pattern) {
      cursorPosition++;
    }
    return TextEditingValue(
      text: allTextDeal,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
```

