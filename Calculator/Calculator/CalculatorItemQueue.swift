import Foundation

protocol CalculateItem {
}

class CalculatorItemQueue: CalculateItem {
}

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}
