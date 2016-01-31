let

uwb = import <urweb-build>;

in with uwb;
  mkUrpLib {

    name = "Uru";

    header = [
      (mkFFI ./Script.urs)
      (mkInclude ./Script.h)
      (mkObj ./Script.c)
    ];

    body = [
      (mkSys "list")
      (mkSrc ./CSS.ur ./CSS.urs)
      (mkSrc ./Uru.ur ./Uru.urs)
    ];

  }
