{ libraries ? {} } :

let

  uwb = import <urweb-build> { inherit libraries; };

in with uwb;

rec {

  audio = mkLib {

    name = "Audio";

    libraries = {
      uru = external ../Uru;
    };

    statements = [
      (ffi ./Audio_HTML5.urs)
      (embed-js ./Audio.js)
      (src1 ./Audio.ur)
    ];
  };

  audio-demo = mkExe {
    name = "AudioDemo";
    dbms = "sqlite";

    buildInputs = with uwb; with uwb.pkgs; [gdb];

    libraries = {
      inherit audio;
    };

    statements = [
      (embed ./demo/vrungel.mp3)
      (src1 ./demo/Audio1.ur)
    ];
  };


}

