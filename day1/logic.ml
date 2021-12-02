let num_inc (a: (Z.t) array) : Z.t =
  let res = ref Z.zero in
  (let o = Z.sub (Z.of_int (Array.length a)) (Z.of_string "2") in
   let o1 = Z.zero in
   let rec for_loop_to i =
     if Z.leq i o
     then begin
       if Z.gt a.(Z.to_int (Z.add i Z.one)) a.(Z.to_int i)
       then (fun r v -> r := Z.add !r v) res Z.one;
       for_loop_to (Z.succ i)
     end
   in for_loop_to o1);
  !res

let num_three_sliding_sum_inc (a: (Z.t) array) : Z.t =
  let res = ref Z.zero in
  (let o = Z.sub (Z.of_int (Array.length a)) (Z.of_string "4") in
   let o1 = Z.zero in
   let rec for_loop_to1 i1 =
     if Z.leq i1 o
     then begin
       if Z.gt a.(Z.to_int (Z.add i1 (Z.of_string "3"))) a.(Z.to_int i1)
       then (fun r v -> r := Z.add !r v) res Z.one;
       for_loop_to1 (Z.succ i1)
     end
   in for_loop_to1 o1);
  !res

