let

uwb = import <urweb-build>;

in with uwb;

rec {
  lib = mkLib {
    name = "Bootstrap";

    statements = [
      (rule "rewrite style 'BootstrapStyles/bs3_table table'")
      (rule "rewrite style 'BootstrapStyles/\* [-]'")
      (ffi ./NavTag.urs)
      (embed-js ./Tooltip.js)
      (lib-extern ../JQuery)
      (lib-extern ../Uru)
      (embed ./dist/fonts/glyphicons-halflings-regular.eot)
      (embed ./dist/fonts/glyphicons-halflings-regular.svg)
      (embed ./dist/fonts/glyphicons-halflings-regular.ttf)
      (embed ./dist/fonts/glyphicons-halflings-regular.woff)
      (embed ./dist/fonts/glyphicons-halflings-regular.woff2)
      (embed-css ./dist/css/bootstrap.css)
      (embed ./dist/css/bootstrap-theme.css)
      (embed ./dist/js/bootstrap.min.js)
      (embed-css ./FormSignin.css)
      (rule "safeGet 'Tooltip_js/enable_tooltips'")
      (src1 ./BootstrapStyles.ur)
      (src1 ./Bootstrap.ur)
      (src1 ./FormSignin.ur)
    ];
  };

  b1 = mkExe {
    name = "Narrow";

    dbms = "sqlite";

    statements = [
      (lib-local lib)
      (sys "list")
      (embed ./test/Narrow.css)
      (src1 ./test/Narrow.ur)
    ];
  };
}
