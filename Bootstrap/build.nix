let

uwb = import <urweb-build>;

in with uwb;

rec {
  lib = mkUrpLib {
    name = "Bootstrap";

    header = [
      (mkVerbose "rewrite style 'BootstrapStyles/bs3_table table'")
      (mkVerbose "rewrite style 'BootstrapStyles/\* [-]'")
      (mkFFI ./NavTag.urs)
      (mkEmbedJS ./Tooltip.js)
      (mkLib ../JQuery)
      (mkLib ../Uru)
      (mkEmbed ./dist/fonts/glyphicons-halflings-regular.eot)
      (mkEmbed ./dist/fonts/glyphicons-halflings-regular.svg)
      (mkEmbed ./dist/fonts/glyphicons-halflings-regular.ttf)
      (mkEmbed ./dist/fonts/glyphicons-halflings-regular.woff)
      (mkEmbed ./dist/fonts/glyphicons-halflings-regular.woff2)
      (mkEmbedCSS ./dist/css/bootstrap.css)
      (mkEmbed ./dist/css/bootstrap-theme.css)
      (mkEmbed ./dist/js/bootstrap.min.js)
      (mkEmbedCSS ./FormSignin.css)
      (mkVerbose "safeGet 'Tooltip_js/enable_tooltips'")
    ];

    body = [
      (mkSrc1 ./BootstrapStyles.ur)
      (mkSrc1 ./Bootstrap.ur)
      (mkSrc1 ./FormSignin.ur)
    ];
  };

  b1 = mkUrpExe {
    name = "Narrow";
    header = [
      (mkLib2 lib)
    ];
    body = [
      (mkSys "list")
      (mkEmbed ./test/Narrow.css)
      (mkSrc1 ./test/Narrow.ur)
    ];
  };
}
