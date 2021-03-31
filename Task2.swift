import UIKit

struct LinkedList<T> {
    var head: LinkedListNode<T>
    init(head: LinkedListNode<T>) {
        self.head = head
    }
}

indirect enum LinkedListNode<T> {
    case value(element: T, next: LinkedListNode<T>)
    case end
}

let elementFive = LinkedListNode.value(element: 5, next: .end)
let elementFour = LinkedListNode.value(element: 4, next: elementFive)
let elementThree = LinkedListNode.value(element: 3, next: elementFour)
let elementTwo = LinkedListNode.value(element: 2, next: elementThree)
let elementOne = LinkedListNode.value(element: 1, next: elementTwo)

let listHead = LinkedList(head: elementOne)


extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: head)
    }
}

struct LinkedListIterator<T>: IteratorProtocol {
    
    var current: LinkedListNode<T>
    
    mutating func next() -> T? {
        switch current {
        case .value(let element, let next):
            current = next
            return element
        case .end:
        return nil
        }
    }
}

for element in listHead {
    print(element) // 1, 2, 3, 4, 5
}
