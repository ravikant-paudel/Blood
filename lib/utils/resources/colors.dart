// Copyright (c) 2020 The Blood Authors. All rights reserved.

import 'package:flutter/material.dart';

const int _rawPrimary = 0xFFCA2B28;
const int _rawAccent = 0xFFFFFFFF;

// --------------- Primary Color-----------------

const MaterialColor primaryColorLight = MaterialColor(
  _rawPrimary,
  {
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

const MaterialColor primaryColorDark = MaterialColor(
  _rawPrimary,
  {
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

// --------------- Accent Color-----------------

const MaterialColor accentColorLight = MaterialColor(
  _rawAccent,
  {
    500: Color(_rawAccent),
  },
);

const MaterialColor accentColorDark = MaterialColor(
  _rawAccent,
  {
    500: Color(_rawAccent),
  },
);

const Color primaryTextLight = Color(0xFF3B3B3B);
const Color secondaryTextLight = Color(0xFF5E5E5E);

const Color primaryTextDark = Color(0xFFFBFBFB);
const Color secondaryTextDark = Color(0xFFFEFEFE);

const Color bloodGroupColor = Color(0xFFd4d4d4);
const Color buttonColor = Color(0xFF11A407);

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
