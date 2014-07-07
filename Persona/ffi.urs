
(* Make an HTTP post request to the given URL. 'post' should contain the HTTP form
   data. Returns None on failure and the data from the URL on success. *)
val http_post : string -> string -> transaction (option string)

(* 'json' is expected to be a valid string of JSON data. Returns the string contained at
   the 'key' in the JSON object. If the JSON is invalid or the key does not exist, returns
   None *)
val json_get_string : string -> string -> transaction (option string)
