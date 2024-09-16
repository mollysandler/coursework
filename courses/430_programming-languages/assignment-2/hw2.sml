(*part 1*)
fun either(pred1: ('a -> bool), (pred2: 'a -> bool)) = 
    fn v => pred1(v) orelse pred2(v)
; 

(*part 2*)
fun satisfiesSome(preds: ('a -> bool) list, v: 'a) =
    case preds of
        [] => false
        | (x::xs) => if x v then true
        else satisfiesSome(xs, v)
;

(*part 3*)
(*dont really understand why parentheses mess this up, i know its curried vs uncurried related but not more than that*)
(*I think i dont super get curried vs uncurried. will ask in lab*)
fun mapSome(pred: ('a -> 'b option)) (l: 'a list) =
    case l of
        [] => []
        | (x::xs) => 
            case pred x of
                NONE => mapSome pred xs
              | SOME y => y::mapSome pred xs
;

(*part 4*)
fun notIn(l, v) =
    not (List.exists (fn a => a = v) l);
;

(*part 5*)
fun getByKey (key: ''a, l: (''a * 'b) list, default: 'b) =
    case List.find (fn (k, v) => k = key) l of
        NONE => default
        | SOME (_, y) => y
;

(*part 6*)
datatype 'a List =
    ListNode of 'a * 'a List
    | EmptyList
;

fun lengthList (l: 'a List) = 
    case l of
    EmptyList => 0
    | ListNode(_, tl) => 1 + lengthList tl 
;

(*part 7*)
fun filterList((preds: 'a -> bool)) (l: 'a List) = 
    case l of
    EmptyList => EmptyList
    | ListNode(v, tl) => 
        if preds (v) then ListNode(v, filterList preds (tl))
        else filterList preds (tl)
;

(*part 8*)
datatype 'a VerboseTree =
    VerboseNode of {value: 'a, left: 'a VerboseTree, right: 'a VerboseTree}
    | Lefty of {value: 'a, left: 'a VerboseTree}
    | Righty of {value: 'a, right: 'a VerboseTree}
    | Leaf of {value: 'a} (*no children*)
    | EmptyVerboseTree (*empty*)
;

fun sumTree(t: int VerboseTree) = 
    case t of
    EmptyVerboseTree => 0
    | Leaf {value} => value
    | Lefty {value, left} => value + sumTree(left)
    | Righty {value, right} => value + sumTree(right)
    | VerboseNode {value, left, right} => value + sumTree(left) + sumTree(right)
;

(*part 9*)
fun gatherTree(t: 'a VerboseTree) = 
    case t of
    EmptyVerboseTree => []
    | Leaf {value} => [value]
    | Lefty {value, left} => value :: gatherTree(left)
    | Righty {value, right} => value :: gatherTree(right)
    | VerboseNode {value, left, right} => value :: gatherTree(left) @ gatherTree(right)
;

(*part 10*)
datatype 'a BinaryTree =
    BinaryNode of {value: 'a, left: 'a BinaryTree, right: 'a BinaryTree}
    | EmptyBinaryTree
;

fun simplifyTree (t: 'a VerboseTree) = 
    case t of
    EmptyVerboseTree => EmptyBinaryTree
    | Leaf {value} => BinaryNode{value = value, left = EmptyBinaryTree, right = EmptyBinaryTree}
    | Lefty {value, left} => BinaryNode{value = value, left = simplifyTree (left), right = EmptyBinaryTree}
    | Righty {value, right} => BinaryNode{value = value, left = EmptyBinaryTree, right = simplifyTree (right)}
    | VerboseNode {value, left, right} => BinaryNode{value = value, left = simplifyTree (left), right = simplifyTree (right)}
;