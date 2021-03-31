import UIKit

class Data {
    
    var number: Int
    var name: String
    
    init(number: Int, name: String) {
        self.number = number
        self.name = name
    }
}
    
var items: [Data] = [Data(number: 1, name: "C"),
                     Data(number: 1, name: "A"),
                     Data(number: 2, name: "D"),
                     Data(number: 1, name: "E"),
                     Data(number: 2, name: "B")]

// MARK: First way

let result = items.sorted(by: { ($0.number, $0.name) < ($1.number, $1.name) })
print(result.map( {"\($0.number)-\($0.name)"} )) // ["1-A", "1-C", "1-E", "2-B", "2-D"]
    

// MARK: Second way

for i in 0..<items.count {
    
    let index = (items.count - 1) - i
    
    for j in 0..<index {
        
        let currentItem = items[j]
        let nextItem = items[j + 1]
        
        if (currentItem.number, currentItem.name) > (nextItem.number, nextItem.name)  {
            items[j] = nextItem
            items[j + 1] = currentItem
        }
    }
}

print(items.map( {"\($0.number)-\($0.name)"} )) // ["1-A", "1-C", "1-E", "2-B", "2-D"]
