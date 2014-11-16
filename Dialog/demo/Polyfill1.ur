

fun main {} : transaction page =
  Uru.run (
  JQuery.add (
  Dialog.add (
  Uru.withHeader (
    <xml>
      <title>Polyfill demo</title>
    </xml>) (
  Uru.withBody (fn _ =>
    x <- fresh;
    return
    <xml>
        <h1>Dialog polyfill demo</h1>
        <dialog id={x}>
        <p>Use this document as a way to quickly start
        any new project.<br/> All you get is this text and a mostly
        barebones HTML document.</p>
        <button value="Close!" onclick={fn _ => Dialog.close x}/>
        </dialog>

        <button value="Show!" onclick={fn _ => Dialog.show x}/>
        <br/>
        <button value="Show modal!" onclick={fn _ => Dialog.showModal x}/>

    </xml>
  )))))
