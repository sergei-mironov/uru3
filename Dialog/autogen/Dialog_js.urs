val binary : unit -> transaction blob
val text : unit -> transaction string
val blobpage : unit -> transaction page
val geturl : url
val dialog_show : id -> transaction unit
val dialog_showModal : id -> transaction unit
val dialog_close : id -> transaction unit
val propagated_urls : list url
