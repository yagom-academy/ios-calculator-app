import Foundation

protocol CalculateItem {
}

class CalculatorItemQueue<T>: LinkedList<T>, CalculateItem {
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
    var tail: Node<T>? {
        guard var finderToTail = head else {
            return nil
        }
        
        while let nextNode = finderToTail.next {
            finderToTail = nextNode
        }
        return finderToTail
    }
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
    
    func removeFirst() -> T? {
        if isEmpty { return nil }
        
        let removedValue: T? = head?.value
        head = head?.next
        return removedValue
    }
    
    func scanAllValue() -> [T] {
        var scanResult: [T] = []

        guard var finderToTail: Node<T> = head else { return scanResult }
        scanResult.append(finderToTail.value)
        
        while let nextNode = finderToTail.next {
            scanResult.append(nextNode.value)
            finderToTail = nextNode
        }
        return scanResult
    }
    
    func removeAll() {
        head = nil
    }
}
