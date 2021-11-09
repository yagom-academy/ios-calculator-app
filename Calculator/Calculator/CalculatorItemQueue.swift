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

class LinkedList<T> {
    var head: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }

    init(head: Node<T>?) {
        self.head = head
    }
    
    func append(value: T) {
        if isEmpty {
            head = Node(value: value)
            return
        }
        
        var finderToTail: Node<T>? = head
        while finderToTail?.next != nil {
            finderToTail = finderToTail?.next
        }
        finderToTail?.next = Node(value: value)
    }
    
    func scanAllValue() -> [T] {
        var scanResult: [T] = []

        guard var finderToTail: Node<T> = head else { return scanResult }
        scanResult.append(finderToTail.value)
        
        guard let nextNode = finderToTail.next else { return scanResult }
        while finderToTail.next != nil {
            finderToTail = nextNode
            scanResult.append(finderToTail.value)
        }
        return scanResult
    }
}
