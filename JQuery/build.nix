let

uwb = import <urweb-build>;

in with uwb;
  mkUrpLib {
    name = "JQuery";

    header = [
      (mkLib ../Uru)
      (mkEmbed ./jquery-1.9.1.js)
    ];

    body = [
      (mkSrc ./JQuery.ur ./JQuery.urs)
    ];

  }
