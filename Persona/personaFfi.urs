(* Wrappers for the JavaScript functions used in Persona. See:
   https://developer.mozilla.org/en-US/Persona/Quick_Setup
*)
val request : unit -> transaction {}
val logout : unit -> transaction {}
val watch : option string ->
            (string -> transaction (option string)) ->
            (unit -> transaction {}) ->
            transaction {} 
