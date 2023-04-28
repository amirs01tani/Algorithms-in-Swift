import UIKit

var greeting = "Hello, playground"

func isIsomorphic(first firstValue: Any, second secondValue: Any) -> Bool {
    let first = String(describing: firstValue)
    let second = String(describing: secondValue)
    
    guard first.count == second.count else { return false }
    
    var charMap = [Character: Character]()
    let firstArray = Array(first)
    let secondArray = Array(second)
    
    for (index, item) in firstArray.enumerated() {
        let otherCharacter = secondArray[index]
        if let currentMapping = charMap[item] {
            if currentMapping != otherCharacter {
                return false
            }
        } else {
            if charMap.values.contains(otherCharacter) {
                return false
            }
            charMap[item] = otherCharacter
        }
    }
    return true
}

print(isIsomorphic(first: ["burp"], second: ["surd"]))
print(isIsomorphic(first: [12341], second: [47854]))
print(isIsomorphic(first: ["burry"], second: "bubby"))
