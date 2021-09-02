exception Boom

let take n xs = 
  let rec aux n xs ys = 
    if n = 0
    then ys
    else match xs with
      | [] -> raise Boom
      | x::xs' -> aux (n - 1) xs' (x::ys) 
  in
  List.rev @@ aux n xs []

let rec drop n xs =
  if n = 0
  then xs
  else match xs with
    | [] -> raise Boom
    | _::xs' -> drop (n - 1) xs' 
                  
let rec merge xs ys zs =
  match (xs,ys) with
  | [], ys' -> zs @ ys' 
  | xs', [] -> zs @ xs'
  | (x::xs'), (y::ys') -> 
      if x < y
      then merge xs' (y::ys') (zs @ [x])
      else merge (x::xs') ys' (zs @ [y])

let partition n xs = 
  let left = take (n/2) xs in
  let right = drop (n/2) xs in 
  (left,right) 
  
let rec sort xs =
  let n = List.length xs in
  if n < 2 
  then xs
  else
    let left, right = partition n xs in
    merge (sort left) (sort right) []
  
let xs = [1;10;2;9;3;8;4;7;5;6];;

sort xs;;