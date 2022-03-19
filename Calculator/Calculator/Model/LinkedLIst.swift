import Foundation

class LinkedList<T> {
    var head: LinkedListNode<T>?
    var tail: LinkedListNode<T>?
    var count: Int = 0
    
    func isEmpty() -> Bool {
        return self.head == nil
    }
    
    func addNode(data: T) {
        if head == nil {
            head = LinkedListNode<T>(data: data)
            tail = head
            count = 1
            return
        }
        let newNode = LinkedListNode<T>(data: data)
        tail?.next = newNode
        tail = newNode
        count += 1
        return
    }
    
    func removeFirstNode() {
        guard head != nil else {
            count = 0
            return
        }
        if head?.next == nil {
            count = 0
            head = nil
            tail = nil
            return
        }
        head = head?.next
        count -= 1
        return 
    }
}
