import Foundation


/*
 The following iterative sequence is defined for the set of positive integers:
 
 n → n/2 (n is even)
 n → 3n + 1 (n is odd)
 
 Using the rule above and starting with 13, we generate the following sequence:
 
 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
 
 Which starting number, under one million, produces the longest chain?
 
 NOTE: Once the chain starts the terms are allowed to go above one million.
 */

func collatz() -> (number:Int?, quantity:Int?) {
    let range = 1..<1_000_000
    var dict = [Int:Int]()
    
    for i in range {
        
        var number = i
        var count = 1
        while number != 1 {
            if let qtd = dict[number] {
                count = count + qtd
                break
            } else if number % 2 == 0 {
                number = number/2
            } else {
                number = (3 * number) + 1
            }
            count = count + 1
        }
        dict[i] = count
        
    }
    return ((dict as NSDictionary).allKeys(for: dict.values.max()).first as! Int, dict.values.max())
}

func p14() {
    let startTime = CFAbsoluteTimeGetCurrent()
    let result = collatz()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed for P14: \(timeElapsed) s")
    if result.number != nil {
        print("Result: \(result.number!) (\(result.quantity!)x)")
    } else {
        print("Error")
    }
}

p14()

