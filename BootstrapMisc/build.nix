{ libraries ? {} } :

let

  uwb = import <urweb-build> { inherit libraries; };

in with uwb;

rec {

  bootstrap-misc = mkLib {

    name = "BootstrapMisc";

    libraries = {
      bootstrap = external ../Bootstrap;
      uru = external ../Uru;
    };

    statements = [
      (embed ./bootstrap-slider/dist/bootstrap-slider.min.js)
      (embed ./bootstrap-slider/dist/css/bootstrap-slider.css)
      (embed-js ./BootstrapSlider.js)
      (src1 ./BootstrapMisc.ur)
    ];
  };

  tests = [(
    mkExe {
      name = "BSM1";

      dbms = "sqlite";

      libraries = {
        inherit bootstrap-misc;
      };

      statements = [
        (set "'https://github.com/grwlf/\*'")
        (set "'https://camo.githubusercontent.com/\*'")
        (sys "list")
        (embed ./test/BSM1.css)
        (src1 ./test/BSM1.ur)
      ];
    }
  )];
}
