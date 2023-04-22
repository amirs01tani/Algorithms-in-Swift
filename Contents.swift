//From Code Challenges Book by Paul Hudson
import UIKit

var greeting = "Hello, playground"
var items = [1,5,3,56,12,33,23,2]
var chars = ["g","c","v","e"]

extension Array where Element: Comparable {
    func bubbleSort() -> [Element] {
        guard count > 1 else { return self }
        
        var returnValue = self
        var swapsMade: Bool
        
        repeat {
            swapsMade = false
            for index in 0..<returnValue.count - 1 {
                let element = returnValue[index]
                let next = returnValue[index + 1]
                if element > next {
                    returnValue.swapAt(index, index + 1)
                    swapsMade = true
                }
            }
            
        } while swapsMade == true
        return returnValue
    }
}

//This simple observation allows us to tweak our sort algorithm so that we loop from 0 up to the index of the highest sorted item – everything after that is guaranteed to be sorted already, so there’s no need to keep checking.
//Here’s the optimized version:

extension Array where Element: Comparable {
    func tweakedBubbleSort() -> [Element] {
        guard count > 1 else { return self }
        
        var returnValue = self
        var highestSortedIndex = count
        
        repeat {
            var lastSwapIndex = 0
            for index in 0..<highestSortedIndex - 1 {
                let element = returnValue[index]
                let next = returnValue[index + 1]
                if element > next {
                    returnValue.swapAt(index, index + 1)
                    lastSwapIndex = index + 1
                }
            }
            highestSortedIndex = lastSwapIndex
        } while highestSortedIndex != 0
        return returnValue
    }
}
