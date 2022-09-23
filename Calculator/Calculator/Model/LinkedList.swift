//  Created by Aejong on 2022/09/23.

struct LinkedList<T> {
    
    private(set) var head: LinkedListNode<T>?
    private(set) var tail: LinkedListNode<T>?
    
    var isEmpty: Bool {
        return self.head == nil
    }
    
    mutating func appendValue(_ value: T) {
        let new = LinkedListNode<T>(value: value)
        
        if self.isEmpty {
            self.head = new
        }
        
        self.tail?.next = new
        new.previous = self.tail
        
        self.tail = new
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
            self.head?.previous = nil
            
            return removedValue
        }
    }
}
