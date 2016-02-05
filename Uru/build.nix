let

uwb = import <urweb-build>;

in with uwb;

  mkLib {

    name = "Uru";

    statements = [
      (ffi ./Script.urs)
      (include ./Script.h)
      (obj ./Script.c)
      (sys "list")
      (src ./CSS.ur ./CSS.urs)
      (src ./Uru.ur ./Uru.urs)
    ];

  }
