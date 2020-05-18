// Learn more about F# at http://fsharp.org

open System


let rec divider num div =
    if div = num then true
    else
        if num % div = 0 then false
        else divider num (div+1)

let pr num = 
    divider num 2
    

let sum_of_digits num =
    let rec sum cur_num cur_sum =
        match cur_num with 
        |0 -> cur_sum
        |_ -> sum (cur_num/10) (cur_sum + cur_num%10)
    sum num 0

let min num1 num2 = 
    if num1 < num2 then num1
    else num2

let max num1 num2 = 
    if num1 > num2 then num1
    else num2

let rec gcd n m = 
    if n = m then n
    else gcd ((max n m) - (min n m)) (min n m)
 
let euler n = 
    let rec sum_mutually_prime num1 num2 cur_sum =
        if num1 = num2 then cur_sum
        else if gcd num1 num2 = 1 then sum_mutually_prime num1 (num2+1) (cur_sum+1)
        else sum_mutually_prime num1 (num2+1) cur_sum
    if n = 1 then 1
    else sum_mutually_prime n 1 0

[<EntryPoint>]
let main argv =
    let answer = euler 71
    Console.Write(answer)
    0 // return an integer exit code
