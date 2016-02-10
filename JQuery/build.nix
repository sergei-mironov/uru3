{ libraries ? {} } :

let

  uwb = import <urweb-build> { inherit libraries; };

in with uwb;
{
  jquery = mkLib {

    name = "JQuery";

    libraries = {
      uru = external ../Uru;
    };

    statements = [
      (embed ./jquery-1.9.1.js)
      (src ./JQuery.ur ./JQuery.urs)
    ];

  };
}
