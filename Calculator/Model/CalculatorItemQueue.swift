//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/02/05.
//

protocol CalculateItem {
    
}

//Array를 이용한 방법 - 추천되지 않음
//struct CalculatorItemQueue<T>: CalculateItem {
//    private var calculatorItemQueue: [T] = []
//
//    public var count: Int {
//        return calculatorItemQueue.count
//    }
//
//    public var isEmpty: Bool {
//        return calculatorItemQueue.isEmpty
//    }
//
//    public func enqueue(_ element: T) {
//        calculatorItemQueue.append(element)
//    }
//
//    public func dequeue(_ element: T) -> T? {
//        return isEmpty ? nil : calculatorItemQueue.removeFirst()
//    }
//
//    public func clear(_ element: T) {
//        calculatorItemQueue.removeAll()
//    }
//
//    List {
//        print("Hi")
//    }
//}

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

//Linked List를 활용한 방법
struct CalculatorItemQueue<T>: CalculateItem {
    var head: Node<T>?
    var tail: Node<T>?
    
    init() {}
    
    var isEmpty: Bool {
        head == nil
    }

    mutating func append(_ value: T) {
        guard !isEmpty else {
            head = Node(value: value)
            tail = head
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    mutating func pop(_ value: T) -> T? {
        // 비어있을 때
        guard let head = self.head else {
            return nil
        }
        // element가 1개일 때
        if head.next == nil {
            self.head = nil
            return head.value
        }
        // element가 2개 이상일 때
        self.head = head.next
        return head.value
    }
}
