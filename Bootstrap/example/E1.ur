
fun main {} : transaction page =
  Uru.run (
  JQuery.add (
  Bootstrap.add (
  Uru.withHeader (
    <xml>
      <title>B3 Login demo</title>
    </xml>) (
  Uru.withBody (fn _ =>
    return
    <xml>
      <div class={Bootstrap.container}>
        <h1>Bootstrap starter template</h1>
        <p class={Bootstrap.lead}>Use this document as a way to quickly start
        any new project.<br/> All you get is this text and a mostly
        barebones HTML document.</p>
      </div>
    </xml>
  )))))

