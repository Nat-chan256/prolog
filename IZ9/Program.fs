// Learn more about F# at http://fsharp.org

open System

let equalsFifthPowSum num = 
    let rec digitsSum num cur_sum =
        if (num = 0) then cur_sum
        else 
            let new_sum = cur_sum + Math.Pow((float)num%10.0, 5.0)
            digitsSum (num/10) new_sum
    digitsSum num 0.0

let countSum = 
    let rec c_s cur_num sum =
        if (cur_num = 1000000) then sum
        else if (equalsFifthPowSum cur_num = (float)cur_num) then
            let new_sum = cur_num + sum
            c_s (cur_num+1) new_sum
        else
            c_s (cur_num+1) sum
    c_s 2 0
            

[<EntryPoint>]
let main argv =
    let sum = countSum
    Console.WriteLine(sum.ToString())
    0 // return an integer exit code
