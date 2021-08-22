open Ppxlib

let num : int ref = ref 0;;

let expand ~ctxt _ =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  let () = (num := !num + 1) in
  Ast_builder.Default.eint ~loc !num

let my_extension =
 Extension.V3.declare
   "incr"
   Extension.Context.expression
   Ast_pattern.(__)
   expand

let rule = Ppxlib.Context_free.Rule.extension my_extension

let () =
 Driver.register_transformation
   ~rules:[rule]
   "incr"