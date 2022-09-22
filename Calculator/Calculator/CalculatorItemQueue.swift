//  Created by Aejong on 2022/09/21.

struct CalculatorItemQueue {
    
    var queue: [String] = []
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: String) {
        queue.append(element)
    }
    
    mutating func dequeue() -> String? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

struct CalculatorItemQueueByLinkedList<T> {
    
    var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return self.linkedList.isEmpty
    }
    
    var front: T? {
        return self.linkedList.head?.value
    }
    
    mutating func enqueue(_ item: T) {
        self.linkedList.appendValue(item)
    }
    
    mutating func dequeue() -> T? {
        return self.linkedList.removeHead()
    }
}

class LinkedListNode<T> {
    let value: T
    weak var previous: LinkedListNode?
    var next: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
    
    deinit {
        print("\(self.value)가 메모리에서 해제됩니다")
    }
}

struct LinkedList<T> {
    
    private(set) var head: LinkedListNode<T>?
    private(set) var tail: LinkedListNode<T>?
    
    var isEmpty: Bool {
        return self.head == nil
    }
    
    mutating func appendValue(_ value: T) {
        let new = LinkedListNode<T>(value: value)
        
        if self.isEmpty {
            self.head = new // 비어있다면 head로 추가
        }
        
        self.tail?.next = new // 꼬리의 다음으로 new 붙여주고
        new.previous = self.tail // new 이전을 꼬리로 연결
        
        self.tail = new // 그리고 자체의 꼬리를 new로 변경
        print("현재 이 링크드리스트의 헤드의 값은 \(self.head?.value)")
        print("테일의 값은 \(self.tail?.value)")
        print("새로 추가된 값은 \(new.value)")
        print("추가되기 직전의 값 previous.value는 \(new.previous?.value)")
    }
    
    mutating func removeHead() -> T? {
        if self.isEmpty {
            return nil
        } else {
            if self.head === self.tail {
                self.tail = nil
            }
            let removedValue = self.head?.value
            
            
            self.head = self.head?.next
//            self.head?.previous = nil
            
            print(self.head?.value)
            return removedValue
        }
    }
    
    
    
}
