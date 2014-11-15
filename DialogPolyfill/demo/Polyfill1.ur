

fun main {} : transaction page =
  Uru.run (
  JQuery.add (
  DialogPolyfill.add (
  Uru.withHeader (
    <xml>
      <title>Polyfill demo</title>
    </xml>) (
  Uru.withBody (fn _ =>
    return
    <xml>
        <h1>Polyfill demo</h1>
        <dialog>
        <p>Use this document as a way to quickly start
        any new project.<br/> All you get is this text and a mostly
        barebones HTML document.</p>
        </dialog>

    </xml>
  )))))
