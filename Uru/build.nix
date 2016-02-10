{ libraries ? {} } :

let

  uwb = import <urweb-build> { inherit libraries; };

in with uwb;

{

  uru = mkLib {

    name = "Uru";

    statements = [
      (ffi ./Script.urs)
      (include ./Script.h)
      (obj-c ./Script.c)
      (sys "list")
      (src ./CSS.ur ./CSS.urs)
      (src ./Uru.ur ./Uru.urs)
    ];

  };

}
