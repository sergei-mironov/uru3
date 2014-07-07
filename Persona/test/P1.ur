
fun main () =
  Uru.run (
  Persona.add (fn p =>
  Uru.withBody (fn _ =>
    return <xml>
      <dyn signal={user <- signal p.Signal; return (Persona.status user)}/>
      <button value="Login" onclick={fn _ => PersonaFfi.request ()}/>
      <button value="Logout" onclick={fn _ => PersonaFfi.logout ()}/>
    </xml>
  )))

