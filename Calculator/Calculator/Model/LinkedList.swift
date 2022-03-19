import Foundation

class LinkedList<T> {
    var head: LinkedListNode<T>?
    var tail: LinkedListNode<T>?
    var count: Int = 0
    var isEmpty: Bool {
        self.head == nil
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
    
    func removeFirstNode() -> LinkedListNode<T>? {
        if head == nil {
            clear()
            return nil
        }
        if head?.next == nil {
            clear()
            count = 0
            return head
        }
        let node = head
        head = head?.next
        count -= 1
        return node
    }
    
    func clear() {
        head = nil
        tail = nil
    }
}
