let () =
  print_endline "Hello, world!"

open Somelib

let () =
  let result = Math.add 2 3 in
  print_endline (string_of_int result);
  let result = Math.sub 3 1 in
  print_endline (string_of_int result);;

  let result = Math2.mul 3 7 in
  print_endline (string_of_int result);