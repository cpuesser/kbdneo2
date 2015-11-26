/****************************** Module Header ******************************\
* Module Name: KBDNEO2.H
* Header f�r das deutsche ergonomische Layout Neo 2.0
\***************************************************************************/
// basiert auf den in der kbd.h definierten KBD-Type 4
#define KBD_TYPE 4

// kbd.h einschlie�en
#include "kbd.h"
#include <dontuse.h>


// Tastenumbelegung f�r Neo 2.0 ; sonstige Tastenzuordnung siehe kbd.h
#undef  T0D
#define T0D _EQ(		 OEM_2		)
#undef  T10
#define T10 _EQ(		 'X'		)
#undef  T11
#define T11 _EQ(		 'V'		)
#undef  T12
#define T12 _EQ(		 'L'		)
#undef  T13
#define T13 _EQ(		 'C'		)
#undef  T14
#define T14 _EQ(		 'W'		)
#undef  T15
#define T15 _EQ(		 'K'		)
#undef  T16
#define T16 _EQ(		 'H'		)
#undef  T17
#define T17 _EQ(		 'G'		)
#undef  T18
#define T18 _EQ(		 'F'		)
#undef  T19
#define T19 _EQ(		 'Q'		)
#undef  T1A
#define T1A _EQ(		 OEM_3		)
#undef  T1B
#define T1B _EQ(		 OEM_4		)
#undef  T1E
#define T1E _EQ(		 'U'		)
#undef  T1F
#define T1F _EQ(		 'I'		)
#undef  T20
#define T20 _EQ(		 'A'		)
#undef  T21
#define T21 _EQ(		 'E'		)
#undef  T22
#define T22 _EQ(		 'O'		)
#undef  T23
#define T23 _EQ(		 'S'		)
#undef  T24
#define T24 _EQ(		 'N'		)
#undef  T25
#define T25 _EQ(		 'R'		)
#undef  T26
#define T26 _EQ(		 'T'		)
#undef  T27
#define T27 _EQ(		 'D'		)
#undef  T28
#define T28 _EQ(		 'Y'		)
#undef  T29
#define T29 _EQ(		 OEM_1		)
#undef  T2B
#define T2B _EQ(		 OEM_102	)	// Mod 3
#undef  T2C
#define T2C _EQ(		 OEM_5		)
#undef  T2D
#define T2D _EQ(		 OEM_6		)
#undef  T2E
#define T2E _EQ(		 OEM_7		)
#undef  T2F
#define T2F _EQ(		 'P'		)
#undef  T30
#define T30 _EQ(		 'Z'		)
#undef  T31
#define T31 _EQ(		 'B'		)
#undef  T35
#define T35 _EQ(		 'J'		)
#undef  T3A
#define T3A _EQ(		 OEM_102	)	// Mod 3
#undef  X38
#define X38 _EQ(		 OEM_8		)	// Mod 4
#undef  T56
#define T56 _EQ(		 OEM_8		)	// Mod 4