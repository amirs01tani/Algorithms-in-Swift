import UIKit

var matchingBrackets = ["(": ")", "[": "]", "{": "}", "<": ">"]
var signs = "([{<>}])"

func isBalanced(input : String) -> Bool {
    var usedSigns = [String]()
    
    for item in input {
        if signs.contains(item) {
            let itemString = String(item)
            if matchingBrackets.keys.contains(itemString) {
                usedSigns.append(itemString)
            } else if matchingBrackets.values.contains(itemString) {
                if let last = usedSigns.popLast(), itemString != matchingBrackets[last] {
                    return false
                }
            }
        }
    }
    return usedSigns.count == 0
}

print(isBalanced(input: "(amir)"))
print(isBalanced(input: "(<amir)"))
print(isBalanced(input: "(amir})"))
print(isBalanced(input: "()"))
print(isBalanced(input: "b(e{a[g<sss>sdsdf]c}b)v"))


