
fun main {} : transaction page =
  Uru.run (
  JQuery.add (
  Bootstrap.add (
  Uru.withBody (fn _ =>
    return
      <xml>
        Hello, Bootstrap
      </xml>
    ))))

