### 类Color

#### 构造函数

```dart
Color(int value):value=value&0xFFFFFFFF
```

#### 构造函数

```dart
const Color.fromARGB(int a, int r, int g, int b) :
    value = (((a & 0xff) << 24) |
             ((r & 0xff) << 16) |
             ((g & 0xff) << 8)  |
             ((b & 0xff) << 0)) & 0xFFFFFFFF;
```

```dart
  const Color.fromRGBO(int r, int g, int b, double opacity) :
    value = ((((opacity * 0xff ~/ 1) & 0xff) << 24) |
              ((r                    & 0xff) << 16) |
              ((g                    & 0xff) << 8)  |
              ((b                    & 0xff) << 0)) & 0xFFFFFFFF;
```

#### 常用属性

```dart
final int value;
int get alpha => (0xff000000 & value) >> 24;
double get opacity => alpha / 0xFF;
int get red => (0x00ff0000 & value) >> 16;
int get green => (0x0000ff00 & value) >> 8;
int get blue => (0x000000ff & value) >> 0;
Color withAlpha(int a) {
    return Color.fromARGB(a, red, green, blue);
  }
```

```dart
Color withOpacity(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }
```

```dart
Color withRed(int r) {
    return Color.fromARGB(alpha, r, green, blue);
  }
```

```dart
Color withGreen(int g) {
    return Color.fromARGB(alpha, red, g, blue);
  }
```

```dart
Color withBlue(int b) {
    return Color.fromARGB(alpha, red, green, b);
  }
```

```dart
double computeLuminance() {
    // See <https://www.w3.org/TR/WCAG20/#relativeluminancedef>
    final double R = _linearizeColorComponent(red / 0xFF);
    final double G = _linearizeColorComponent(green / 0xFF);
    final double B = _linearizeColorComponent(blue / 0xFF);
    return 0.2126 * R + 0.7152 * G + 0.0722 * B;
  }
```

```dart
static Color? lerp(Color? a, Color? b, double t) {
    if (b == null) {
      if (a == null) {
        return null;
      } else {
        return _scaleAlpha(a, 1.0 - t);
      }
    } else {
      if (a == null) {
        return _scaleAlpha(b, t);
      } else {
        return Color.fromARGB(
          _clampInt(_lerpInt(a.alpha, b.alpha, t).toInt(), 0, 255),
          _clampInt(_lerpInt(a.red, b.red, t).toInt(), 0, 255),
          _clampInt(_lerpInt(a.green, b.green, t).toInt(), 0, 255),
          _clampInt(_lerpInt(a.blue, b.blue, t).toInt(), 0, 255),
        );
      }
    }
  }
```

```dart
static Color alphaBlend(Color foreground, Color background) {
    final int alpha = foreground.alpha;
    if (alpha == 0x00) { // Foreground completely transparent.
      return background;
    }
    final int invAlpha = 0xff - alpha;
    int backAlpha = background.alpha;
    if (backAlpha == 0xff) { // Opaque background case
      return Color.fromARGB(
        0xff,
        (alpha * foreground.red + invAlpha * background.red) ~/ 0xff,
        (alpha * foreground.green + invAlpha * background.green) ~/ 0xff,
        (alpha * foreground.blue + invAlpha * background.blue) ~/ 0xff,
      );
    } else { // General case
      backAlpha = (backAlpha * invAlpha) ~/ 0xff;
      final int outAlpha = alpha + backAlpha;
      assert(outAlpha != 0x00);
      return Color.fromARGB(
        outAlpha,
        (foreground.red * alpha + background.red * backAlpha) ~/ outAlpha,
        (foreground.green * alpha + background.green * backAlpha) ~/ outAlpha,
        (foreground.blue * alpha + background.blue * backAlpha) ~/ outAlpha,
      );
    }
  }
```

```dart
static int getAlphaFromOpacity(double opacity) {
    return (clampDouble(opacity, 0.0, 1.0) * 255).round();
  }
```

