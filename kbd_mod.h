/****************************************************************************\
* Module Name: KBD_MOD.H
* �nderungen an der KBD.H f�r das deutsches ergonomische Layout Neo 2.0
\****************************************************************************/

#undef DEADTRANS
#define DEADTRANS(accent, ch, comp, flags) { MAKELONG(ch, accent), comp, flags}