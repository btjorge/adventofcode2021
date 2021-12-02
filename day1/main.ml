let rec read_lines ic =
  try
    let l = input_line ic in
    l :: read_lines ic
  with End_of_file -> []

let () =
  let ic = open_in "input" in
  let l = List.map Z.of_string (read_lines ic) in
  let a = Array.of_list l in
  Printf.printf "Number of increases: %a\n" Z.output (Logic.num_inc a);
  Printf.printf "Number of three slinding sum increases: %a\n"
    Z.output (Logic.num_three_sliding_sum_inc a);
