import Foundation
    
func toWords(number:Int) -> String {
    let digits = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    let tens = ["", "","twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
    let teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    
    switch number {
    case 1000:
        return "onethousand"
    case 100...999:
        let mod100 = toWords(number: number%100)
        if mod100 != "" {
            return "\(digits[number/100])hundredand\(mod100)"
        } else {
            return "\(digits[number/100])hundred"
        }
    case 20...99:
        let mod10 = toWords(number: number%10)
        if mod10 != "" {
            return "\(tens[number/10])\(mod10)"
        } else {
            return tens[number/10]
        }
    case 10...19:
        return teens[number%10]
    case 1...9:
        return digits[number]
    default:
        return ""
    }
}

func p17() {
    var length = 0
    for i in 1...1000 {
        length += toWords(number: i).characters.count
    }
    print("Total = \(length)")
}

p17()