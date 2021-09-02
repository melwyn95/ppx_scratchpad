(* let () = print_string [%get_env "PATH"]

let () = print_int [%incr]
let () = print_int [%incr]
let () = print_int [%incr]
let () = print_int [%incr]
let () = print_int [%incr]
let () = print_int [%incr] *)

let () = print_endline @@ Hash.sha1 "./main.ml"