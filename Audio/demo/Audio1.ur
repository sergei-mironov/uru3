
open Audio

fun main {} : transaction page =
  Uru.run (
  Audio.add (
  Uru.withBody (fn _ =>
    x <- fresh;
    return
    <xml>
      <h1>Audio test</h1>

      <audio id={x} src={Vrungel_mp3.geturl} controls/>

      <hr/>

      <p>
        <button value="Play" onclick={fn _ => audio_play x } />
        <button value="Pause" onclick={fn _ => audio_pause x } />
        <button value="Rewind" onclick={fn _ => audio_position x 0 } />
      </p>

    </xml>
  )))

