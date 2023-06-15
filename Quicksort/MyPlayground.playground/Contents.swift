import UIKit

var greeting = "Hello, playground"

extension Array where Element: Comparable {
    func poorQuickSort() -> [Element] {
        guard count > 0 else { return self }
        
        let pivot = self[count/2]
        
        var before = [Element]()
        var after = [Element]()
        var equal = [Element]()
        
        for item in self {
            if item < pivot {
                before.append(item)
            } else if item > pivot {
                after.append(item)
            } else {
                equal.append(item)
            }
        }
        return before.poorQuickSort() + equal + after.poorQuickSort()
    }
}

extension Array where Element: Comparable {
    func shortQuickSort() -> [Element] {
        guard count > 0 else { return self }
        
        let pivot = self[count/2]
        
        var before = filter({ $0 < pivot })
        var after = filter({ $0 > pivot })
        var equal = filter({ $0 == pivot })
        
        return before.poorQuickSort() + equal + after.poorQuickSort()
    }
}

extension Array where Element: BinaryInteger {
    mutating func realQuickSort(left: Int, right: Int) {
        guard left < right else { return }
        
        let pivot = self[right]
        var start = left
        // If it is smaller then move the start point forward
        for i in left..<right {
            if self[i] < pivot {
                (self[i], self[start]) = (self[start], self[i])
                start += 1
            }
        }
        // Cuz start point is the biggest ever found exchange it with right edge
        (self[right], self[start]) = (self[start], self[right])
        realQuickSort(left: left, right: start - 1)
        realQuickSort(left: start + 1, right: right)
    }
}


print([4,2,7,45,12,5,667,86,4].poorQuickSort())
print([4,2,7,45,12,5,667,86,4].shortQuickSort())
var myarray = [4,2,7,45,12,5,667,86,4]
myarray.realQuickSort(left: 0, right: 8)
print(myarray)

