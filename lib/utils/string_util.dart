/// description: 字符串工具类

class StringUtil {
  /// isEmpty
  static bool isEmpty(String? text) {
    return text == null || text.isEmpty;
  }

  /// 每隔 x位 加 pattern
  static String formatDigitPattern(String text, {int digit = 4, String pattern = ' '}) {
    text = text.replaceAllMapped(RegExp("(.{$digit})"), (Match match) {
      return "${match.group(0)}$pattern";
    });
    if (text.endsWith(pattern)) {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }

  /// 每隔 x位 加 pattern, 从末尾开始
  static String formatDigitPatternEnd(String text, {int digit = 4, String pattern = ' '}) {
    String temp = reverse(text);
    temp = formatDigitPattern(temp, digit: digit, pattern: pattern);
    temp = reverse(temp);
    return temp;
  }

  /// 每隔4位加空格
  static String formatSpace4(String text) {
    return formatDigitPattern(text);
  }

  /// 超过1万省略万后面的字，保留2位数输出
  static String formatThousandComma3(int num, {String unit = '万'}) {
    if (num < 10000) {
      return num.toString();
    }

    double number = num.toDouble() / 100000.0;
    return number.toStringAsFixed(2) + unit;
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。int型。
  static String formatComma3(Object num) {
    return formatDigitPatternEnd(num.toString(), digit: 3, pattern: ',');
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。double型。
  static String formatDoubleComma3(Object num, {int digit = 3, String pattern = ','}) {
    List<String> list = num.toString().split('.');
    String left = formatDigitPatternEnd(list[0], digit: digit, pattern: pattern);
    String right = '0';

    if (list.length > 1) {
      right = list[1];
    }
    return '$left.$right';
  }

  /// hideNumber
  static String hideNumber(String phoneNo, {int start = 3, int end = 7, String replacement = '****'}) {
    return phoneNo.replaceRange(start, end, replacement);
  }

  /// replace
  static String replace(String text, Pattern from, String replace) {
    return text.replaceAll(from, replace);
  }

  /// split
  static List<String> split(String text, Pattern pattern, {List<String> defValue = const []}) {
    List<String> list = text.split(pattern);
    return list;
  }

  /// reverse
  static String reverse(String text) {
    if (isEmpty(text)) return '';
    StringBuffer sb = StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      sb.writeCharCode(text.codeUnitAt(i));
    }
    return sb.toString();
  }

  ///
  /// Checks if the given string [s] is lower case
  ///
  static bool isLowerCase(String s) {
    return s == s.toLowerCase();
  }

  ///
  /// Checks if the given string [s] is upper case
  ///
  static bool isUpperCase(String s) {
    return s == s.toUpperCase();
  }

  ///
  /// Transfers the given String [s] from camcelCase to upperCaseUnderscore
  /// Example : helloWorld => HELLO_WORLD
  ///
  static String camelCaseToUpperUnderscore(String s) {
    var sb = StringBuffer();
    var first = true;
    for (var rune in s.runes) {
      var char = String.fromCharCode(rune);
      if (isUpperCase(char) && !first) {
        sb.write('_');
        sb.write(char.toUpperCase());
      } else {
        first = false;
        sb.write(char.toUpperCase());
      }
    }
    return sb.toString();
  }

  ///
  /// Transfers the given String [s] from camcelCase to lowerCaseUnderscore
  /// Example : helloWorld => hello_world
  ///
  static String camelCaseToLowerUnderscore(String s) {
    var sb = StringBuffer();
    var first = true;
    for (var rune in s.runes) {
      var char = String.fromCharCode(rune);
      if (isUpperCase(char) && !first) {
        sb.write('_');
        sb.write(char.toLowerCase());
      } else {
        first = false;
        sb.write(char.toLowerCase());
      }
    }
    return sb.toString();
  }

  ///
  /// Capitalize the given string [s]. If [allWords] is set to true, it will capitalize all words within the given string [s].
  ///
  /// The string [s] is there fore splitted by " " (space).
  ///
  /// Example :
  ///
  /// * [s] = "world" => World
  /// * [s] = "WORLD" => World
  /// * [s] = "the quick lazy fox"  => The quick lazy fox
  /// * [s] = "the quick lazy fox" and [allWords] = true => The Quick Lazy Fox
  ///
  static String capitalize(String s, {bool allWords = false}) {
    if (allWords) {
      var words = s.split(' ');
      var capitalized = [];
      for (var w in words) {
        capitalized.add(capitalize(w));
      }
      return capitalized.join(' ');
    } else {
      return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
    }
  }

  ///
  /// Counts how offen the given [char] apears in the given string [s].
  /// The value [caseSensitive] controlls whether it should only look for the given [char]
  /// or also the equivalent lower/upper case version.
  /// Example: Hello and char l => 2
  ///
  static int countChars(String s, String char, {bool caseSensitive = true}) {
    var count = 0;
    s.codeUnits.toList().forEach((i) {
      if (caseSensitive) {
        if (i == char.runes.first) {
          count++;
        }
      } else {
        if (i == char.toLowerCase().runes.first || i == char.toUpperCase().runes.first) {
          count++;
        }
      }
    });
    return count;
  }

  ///
  /// Checks if the given string [s] is a digit.
  ///
  /// Will return false if the given string [s] is empty.
  ///
  static bool isDigit(String s) {
    if (s.isEmpty) {
      return false;
    }
    if (s.length > 1) {
      for (var r in s.runes) {
        if (r ^ 0x30 > 9) {
          return false;
        }
      }
      return true;
    } else {
      return s.runes.first ^ 0x30 <= 9;
    }
  }

  ///
  /// Compares the given strings [a] and [b].
  ///
  // ignore: unnecessary_null_comparison
  static bool equalsIgnoreCase(String a, String b) => (a == null && b == null) || (a.toLowerCase() == b.toLowerCase());

  ///
  /// Checks if the given [list] contains the string [s]
  ///
  static bool inList(String s, List<String> list, {bool ignoreCase = false}) {
    for (var l in list) {
      if (ignoreCase) {
        if (equalsIgnoreCase(s, l)) {
          return true;
        }
      } else {
        if (s == l) {
          return true;
        }
      }
    }
    return false;
  }

  ///
  /// Checks if the given string [s] is a palindrome
  /// Example :
  /// aha => true
  /// hello => false
  ///
  static bool isPalindrome(String s) {
    for (var i = 0; i < s.length / 2; i++) {
      if (s[i] != s[s.length - 1 - i]) return false;
    }
    return true;
  }

  ///
  /// Replaces chars of the given String [s] with [replace].
  ///
  /// The default value of [replace] is *.
  /// [begin] determines the start of the 'replacing'. If [begin] is null, it starts from index 0.
  /// [end] defines the end of the 'replacing'. If [end] is null, it ends at [s] length divided by 2.
  /// If [s] is empty or consists of only 1 char, the method returns null.
  ///
  /// Example :
  /// 1234567890 => *****67890
  /// 1234567890 with begin 2 and end 6 => 12****7890
  /// 1234567890 with begin 1 => 1****67890
  ///
  static String hidePartial(String s, {int begin = 0, int? end, String replace = '*'}) {
    var buffer = StringBuffer();
    if (s.length <= 1) {
      return "";
    }
    if (end == null) {
      end = (s.length / 2).round();
    } else {
      if (end > s.length) {
        end = s.length;
      }
    }
    for (var i = 0; i < s.length; i++) {
      if (i >= end) {
        buffer.write(String.fromCharCode(s.runes.elementAt(i)));
        continue;
      }
      if (i >= begin) {
        buffer.write(replace);
        continue;
      }
      buffer.write(String.fromCharCode(s.runes.elementAt(i)));
    }
    return buffer.toString();
  }

  ///
  /// Add a [char] at a [position] with the given String [s].
  ///
  /// The boolean [repeat] defines whether to add the [char] at every [position].
  /// If [position] is greater than the length of [s], it will return [s].
  /// If [repeat] is true and [position] is 0, it will return [s].
  ///
  /// Example :
  /// 1234567890 , '-', 3 => 123-4567890
  /// 1234567890 , '-', 3, true => 123-456-789-0
  ///
  static String addCharAtPosition(String s, String char, int position, {bool repeat = false}) {
    if (!repeat) {
      if (s.length < position) {
        return s;
      }
      var before = s.substring(0, position);
      var after = s.substring(position, s.length);
      return before + char + after;
    } else {
      if (position == 0) {
        return s;
      }
      var buffer = StringBuffer();
      for (var i = 0; i < s.length; i++) {
        if (i != 0 && i % position == 0) {
          buffer.write(char);
        }
        buffer.write(String.fromCharCode(s.runes.elementAt(i)));
      }
      return buffer.toString();
    }
  }

  ///
  /// Splits the given String [s] in chunks with the given [chunkSize].
  ///
  static List<String> chunk(String s, int chunkSize) {
    var chunked = <String>[];
    for (var i = 0; i < s.length; i += chunkSize) {
      var end = (i + chunkSize < s.length) ? i + chunkSize : s.length;
      chunked.add(s.substring(i, end));
    }
    return chunked;
  }

  // 判断是否是网络图片格式
  static bool checkUrlImage(String? s) {
    return !isEmpty(s) && s!.contains("http") && (s.contains("jpg") || s.contains("png") || s.contains("jpeg"));
  }
}
