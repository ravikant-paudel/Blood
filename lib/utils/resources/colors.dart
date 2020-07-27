// Copyright (c) 2020 The Blood Authors. All rights reserved.

part  of 'theme.dart';

const int _rawPrimary = 0xFFDE2C2C;
const int _rawSurface = 0xFF1A1A1A;
const int _rawAccent = 0xFFEE2A7B;

const Color _secondaryColor = Color(0xFFFAA61A);
const Color _complementaryColor = Color(0xFFFED236);
const Color _errorColor = Color(0xFFCF3636);

// --------------- Accent Color-----------------

const BloodColor _accentColorLight = BloodColor(
  'AccentLight',
  _rawAccent,
  {
    200: Color(0xFFF85C9D),
    500: Color(_rawAccent),
  },
);

const BloodColor _accentColorDark = BloodColor(
  'AccentDark',
  _rawAccent,
  {
    200: Color(0xFFF85C9D),
    500: Color(_rawAccent),
  },
);

// --------------- Primary Color-----------------

const BloodColor _primaryColorLight = BloodColor(
  'PrimaryLight',
  _rawPrimary,
  {
    10: Color(0xFFfbe9e9),
    20: Color(0xFFf8d4d4),
    30: Color(0xFFf5bfbf),
    40: Color(0xFFf1aaaa),
    50: Color(0xFFee9595),
    100: Color(0xFFeb8080),
    200: Color(0xFFe76b6b),
    300: Color(0xFFe45656),
    400: Color(0xFFe14141),
    500: Color(_rawPrimary),
    600: Color(0xFFc72727),
    700: Color(0xFFb12323),
    800: Color(0xFF9b1e1e),
    900: Color(0xFF851a1a),
  },
);

const BloodColor _primaryColorDark = BloodColor(
  'PrimaryDark',
  _rawPrimary,
  {
    10: Color(0xFFfbe9e9),
    20: Color(0xFFf8d4d4),
    30: Color(0xFFf5bfbf),
    40: Color(0xFFf1aaaa),
    50: Color(0xFFee9595),
    100: Color(0xFFeb8080),
    200: Color(0xFFe76b6b),
    300: Color(0xFFe45656),
    400: Color(0xFFe14141),
    500: Color(_rawPrimary),
    600: Color(0xFFc72727),
    700: Color(0xFFb12323),
    800: Color(0xFF9b1e1e),
    900: Color(0xFF851a1a),
  },
);

// --------------- Surface Color-----------------

const BloodColor _surfaceColorLight = BloodColor(
  'Surface Light',
  _rawSurface,
  {
    5: Color(0xFFF4F4F4),
    10: Color(0xFFe8e8e8),
    20: Color(0xFFd1d1d1),
    30: Color(0xFFbababa),
    40: Color(0xFFa3a3a3),
    50: Color(0xFF8c8c8c),
    100: Color(0xFF757575),
    200: Color(0xFF5e5e5e),
    300: Color(0xFF474747),
    400: Color(0xFF303030),
    500: Color(_rawSurface),
  },
);

const BloodColor _surfaceColorDark = BloodColor(
  'Surface Dark',
  _rawSurface,
  {
    5: Color(0xFFF4F4F4),
    10: Color(0xFFe8e8e8),
    20: Color(0xFFd1d1d1),
    30: Color(0xFFbababa),
    40: Color(0xFFa3a3a3),
    50: Color(0xFF8c8c8c),
    100: Color(0xFF757575),
    200: Color(0xFF5e5e5e),
    300: Color(0xFF474747),
    400: Color(0xFF303030),
    500: Color(_rawSurface),
  },
);

class BloodColor extends MaterialColor {
  // Just for debugging purpose.
  final String tag;

  const BloodColor(this.tag, int primary, Map<int, Color> swatch) : super(primary, swatch);

  Color get shade5 => _color(5);
  Color get shade10 => _color(10);
  Color get shade20 => _color(20);
  Color get shade30 => _color(30);
  Color get shade40 => _color(40);
  @override
  Color get shade50 => _color(50);
  @override
  Color get shade100 => _color(100);
  @override
  Color get shade200 => _color(200);
  @override
  Color get shade300 => _color(300);
  @override
  Color get shade400 => _color(400);
  @override
  Color get shade600 => _color(600);
  @override
  Color get shade700 => _color(700);
  @override
  Color get shade800 => _color(800);
  @override
  Color get shade900 => _color(900);

  Color _color(int shade) {
    assert(this[shade] != null, 'Invalid shade:: $shade, on $tag');
    return this[shade];
  }
}

/*

Opacity values in hex

0% — 00

1% — 03      2% — 05      3% — 08      4% — 0A      5% — 0D      6% — 0F      7% — 12      8% — 14      9% — 17      10% — 1A

11% — 1C     12% — 1F     13% — 21     14% — 24     15% — 26     16% — 29     17% — 2B     18% — 2E     19% — 30     20% — 33

21% — 36     22% — 38     23% — 3B     24% — 3D     25% — 40     26% — 42     27% — 45     28% — 47     29% — 4A     30% — 4D

31% — 4F     32% — 52     33% — 54     34% — 57     35% — 59     36% — 5C     37% — 5E     38% — 61     39% — 63     40% — 66

41% — 69     42% — 6B     43% — 6E     44% — 70     45% — 73     46% — 75     47% — 78     48% — 7A     49% — 7D     50% — 80

51% — 82     52% — 85     53% — 87     54% — 8A     55% — 8C     56% — 8F     57% — 91     58% — 94     59% — 96     60% — 99

61% — 9C     62% — 9E     63% — A1     64% — A3     65% — A6     66% — A8     67% — AB     68% — AD     69% — B0     70% — B3

71% — B5     72% — B8     73% — BA     74% — BD     75% — BF     76% — C2     77% — C4     78% — C7     79% — C9     80% — CC

81% — CF     82% — D1     83% — D4     84% — D6     85% — D9     86% — DB     87% — DE     88% — E0     89% — E3     90% — E6

91% — E8     92% — EB     93% — ED     94% — F0     95% — F2     96% — F5     97% — F7     98% — FA     99% — FC     100% — FF

*/
