import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add: return Self.add(lhs: lhs, rhs: rhs)
        case .subtract: return Self.subtract(lhs: lhs, rhs: rhs)
        case .divide: return Self.divide(lhs: lhs, rhs: rhs)
        case .multiply: return Self.multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    static private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    static private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    static private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    static private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}

protocol CalculateItem {
}

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var items: LinkedList<T> = LinkedList<T>(head: nil)

    mutating func enqueue(value: T) {
        items.append(value: value)
    }

    mutating func dequeue() -> T? { // 빈 큐에서 dequeue 하면 오류처리를 해야 할까?
        let removedValue: T? = items.removeFirst()
        return removedValue
    }

    mutating func scanAllValues() -> [T] {
        let allValues: [T] = items.scanAllValues()
        return allValues
    }

    mutating func allClear() {
        items.removeAll()
    }
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
