let

uwb = import <urweb-build>;

in with uwb;

  mkLib {
    name = "JQuery";

    statements = [
      (lib-extern ../Uru)
      (embed ./jquery-1.9.1.js)
      (src ./JQuery.ur ./JQuery.urs)
    ];

  }
