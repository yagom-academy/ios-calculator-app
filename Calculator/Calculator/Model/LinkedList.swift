import Foundation

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
        let newNode: Node<T> = Node(value: value)
        if isEmpty {
            head = newNode
            return
        }
        tail?.next = newNode
    }
    
    func removeFirst() -> T? {
        if isEmpty { return nil }
        
        let removedValue: T? = head?.value
        head = head?.next
        return removedValue
    }
    
    func scanAllValues() -> [T] {
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
