{ libraries ? {} } :

let

  uwb = import <urweb-build> { inherit libraries; };

in with uwb;

rec {

  bootstrap = mkLib {

    name = "Bootstrap";

    libraries = {
      jquery = external ../JQuery;
      uru = external ../Uru;
    };

    statements = [
      (rule "rewrite style BootstrapStyles/bs3_table table")
      (rule "rewrite style BootstrapStyles/\* [-]")
      (rule "safeGet Tooltip_js/enable_tooltips")
      (ffi ./NavTag.urs)
      (embed-js ./Tooltip.js)
      (embed ./dist/fonts/glyphicons-halflings-regular.eot)
      (embed ./dist/fonts/glyphicons-halflings-regular.svg)
      (embed ./dist/fonts/glyphicons-halflings-regular.ttf)
      (embed ./dist/fonts/glyphicons-halflings-regular.woff)
      (embed ./dist/fonts/glyphicons-halflings-regular.woff2)
      (embed-css ./dist/css/bootstrap.css)
      (embed ./dist/css/bootstrap-theme.css)
      (embed ./dist/js/bootstrap.min.js)
      (embed-css ./FormSignin.css)
      (src1 ./BootstrapStyles.ur)
      (src1 ./Bootstrap.ur)
      (src1 ./FormSignin.ur)
    ];
  };

  bootstrap-demo = mkExe {
    name = "Demo";
    dbms = "sqlite";

    libraries = {
      inherit bootstrap;
    };

    statements = [
      (sys "list")
      (rule "allow url https://github.com/grwlf/uru3")
      (rule "allow url  https://camo.githubusercontent.com/365986a132c*")
      (embed ./test/Narrow.css)
      (src1 ./test/Narrow.ur)
      (embed ./test/B1.css)
      (src1 ./test/B1.ur)
      (embed ./test/holder.js)
      (embed ./test/B2.css)
      (src1 ./test/B2.ur)
      (embed ./test/B3_Login.css)
      (src1 ./test/B3_Login.ur)
      (embed ./test/Modal.css)
      (src1 ./test/Modal.ur)
    ];
  };

}
