{ libraries ? {} } :

let

  uwb = import <urweb-build> { inherit libraries; };

  distr = uwb.pkgs.fetchgit {
    url = "https://github.com/ccampbell/mousetrap";
    rev = "d5f3beda1802b4abd402363bedf8ea5f2d1ae2df";
    sha256 = "0sh34z53iwa20dri04bpbkal4pq6gbx9f5wn4mvfzxjjahn62qn7";
  };

in with uwb;

rec {

  mousetrap = mkLib {

    name = "Mousetrap";

    libraries = {
      uru = external ../Uru;
    };

    statements = [
      (embed "${distr}/mousetrap.min.js")
      (src1 ./Mousetrap.ur)
    ];
  };

}

