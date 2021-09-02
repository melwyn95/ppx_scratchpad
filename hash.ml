
let rec fold_file f init ic =
  let buf = Bytes.create 4096 in
  let read = input ic buf 0 4096 in
  if read = 0
  then init
  else fold_file f (f init buf 0 read) ic


let sha1 filename = 
  let ic = open_in_bin filename in
  let ctx = Digestif.SHA1.empty in
  let ctx = fold_file (fun ctx buf off len -> Digestif.SHA1.feed_bytes ctx ~off ~len buf) ctx ic in
  let hash = Digestif.SHA1.get ctx in
  Digestif.SHA1.to_hex hash