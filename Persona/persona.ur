(* Example of using Persona authentication system based on;
   https://developer.mozilla.org/en-US/Persona/Quick_Setup

   Session handling code loosely based on code from Ur/Web OpenId
   code but stripped down for simplicity:

   http://hg.impredicative.com/openid
*)

(* For this example the 'user' is just the email address provided by Persona *)
type user = string

(* Session expiry time *)
val expireSeconds = 3600 * 24

sequence sessionIds

table session : {Id : int, Key : int, Identifier : string, Expires : time}
  PRIMARY KEY Id

task periodic 60 = fn () => dml (DELETE FROM session
                                 WHERE Expires < CURRENT_TIMESTAMP)

datatype authMode =
       LoggedIn of {User : user, Session : int, Key : int}

cookie auth : authMode

(* Set HTTP header required by Persona to make sure IE users don't use
   compatibility mode. *)
fun noCompatibilityMode () = 
  setHeader (blessResponseHeader "X-UA-Compatible") "IE=Edge"

(* Create a new session in the database for the user *)
fun newSession email =
  ses <- nextval sessionIds;
  now <- now;
  key <- rand;
  dml (INSERT INTO session (Id, Key, Identifier, Expires)
         VALUES ({[ses]}, {[key]}, {[email]}, {[addSeconds now expireSeconds]}));
  return {Session = ses, Key = key}

fun startSession email = 
  ses <- newSession email;
  setCookie auth {Value = LoggedIn ({User = email} ++ ses),
                  Expires = None,
                  Secure = False};
  return (Some email)

(* Check the JSON returned from Mozilla's verification server contains
   a successful login *)
fun checkValidationJson json = 
  status <- Ffi.json_get_string json "status";
  email <- Ffi.json_get_string json "email";
  case (status, email) of
  | (Some "okay", Some email) => startSession email
  | _ => return None

(* Called by the Persona JS code to start signing in. 'authentication'
   is a string of data that needs to be passed to a verification server
*)
fun signin assertion = let 
  val url = "https://verifier.login.persona.org/verify"
  (* val assertion = "assertion=" ^ assertion ^ "&audience=http://127.0.0.1:80" *)
  val assertion = "assertion=" ^ assertion ^ "&audience=http://localhost:8080"
in
  debug "signin has been called";
  debug ("assertion is " ^ assertion);
  (* return (Some "blabla") *)
  json <- Ffi.http_post url assertion;
  case json of
  | None => debug "http_post -> none"; return None
  | Some json =>  debug "http_post -> some";checkValidationJson json
end

(* Called by the Persona JS code when the user signs out *)
fun signout () = 
  login <- getCookie auth;
  clearCookie auth;
  (case login of
   | Some (LoggedIn login) =>
      dml (DELETE FROM session
                 WHERE Id = {[login.Session]}
                 AND Key = {[login.Key]});
      return ()
   | _ => return ())


(* Return's the currently authenticated user or None *)
fun authedUser () =
  login <- getCookie auth;
  case login of
    | None => return None
    | Some (LoggedIn login) =>
       ident <- oneOrNoRowsE1 (SELECT (session.Identifier)
                                FROM session
                                WHERE session.Id = {[login.Session]}
                                AND session.Key = {[login.Key]});
       case ident of
       | Some ident => return (Some login.User)
       | _ => return None

(* Return something to be displayed to indicate the users login status *)
fun status (user : option string) : xbody = 
  case user of
  | None => <xml>No user is signed in</xml>
  | Some user => <xml>{[user]} is signed in</xml>

(* When the page loads this calls the 'watch' JS function,
   passing it the currently logged in user and callbacks
   for when a user logs in or out. 's' is a source from the
   Ur/Web reactive system to allow showing the login status
   of the user without refreshing the page. *)
fun onload s user = PersonaFfi.watch user
                                     (fn x => user <- rpc (signin x);
                                              set s user;
                                              return user)
                                     (fn () => rpc (signout ());
                                               set s None)

type persdata = {Signal:source (option string), User:option string}

con need = []
con out = need

fun add [t] [t~out] (f:persdata -> record (dpage (t++out)) -> transaction page) (r:record (dpage (t ++ need))) = 
  let
    val h = <xml>
        {Script.insert Uru.javascript Urweb_persona_js.geturl}
      </xml> 
  in
    noCompatibilityMode();
    user <- authedUser ();
    s <- source user; 
    f {Signal=s,User=user} (Uru.addHeader h (Uru.addOnLoad (onload s user) (r)))
  end

(*
fun main () = Uru.run
  (add
  (Uru.withBody
  (fn r =>
    s <- return r.Tags.Persona.Signal;
    return <xml>
      <dyn signal={user <- signal s; return (status user)}/>
      <button value="Login" onclick={fn _ => PersonaFfi.request ()}/>
      <button value="Logout" onclick={fn _ => PersonaFfi.logout ()}/>
    </xml>
  )))

fun main () = 
    noCompatibilityMode();
    user <- authedUser ();
    s <- source user; 
    return <xml>
    <head>
      <title>Ur/Web Persona Example</title>
    </head>
    <body onload={onload s user}>
      <dyn signal={user <- signal s; return (status user)}/>
      <button value="Login" onclick={fn _ => PersonaFfi.request ()}/>
      <button value="Logout" onclick={fn _ => PersonaFfi.logout ()}/>
    </body>
</xml>
*)

