/*
 * create by zhangchunhua
 * 空格符--RegExp(r'\s+\b|\b\s')
 * 注意点--需要对分隔符允许输入
 * 注意点--后期对文本内容清除分隔符
 * 官方类--LengthLimitingTextInputFormatter,FilteringTextInputFormatter
 * 只允许数字和X和x和空格--FilteringTextInputFormatter.allow(RegExp(r'[0-9Xx\s]')),
 */
import 'package:flutter/services.dart';

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
