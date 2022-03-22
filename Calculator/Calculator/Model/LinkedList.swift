import Foundation

class LinkedList<T> {
    var head: LinkedListNode<T>?
    var tail: LinkedListNode<T>?
//    var count: Int = 0
    var isEmpty: Bool {
        head == nil
    }

    func addNode(data: T) {
        let newNode = LinkedListNode<T>(data: data)
        if head == nil {
            head = newNode
            tail = head
        } else {
        tail?.next = newNode
        tail = newNode
        }
//        count += 1
    }
    
    func removeFirstNode() -> LinkedListNode<T>? {
        if head == nil {
            clear()
            return nil
        } else if head?.next == nil {
//            count = 0
            let headNode = head
            clear()
            return headNode
        } else {
        let node = head
        head = head?.next
//        count -= 1
        return node
        }
    }
    
    private func clear() {
        head = nil
        tail = nil
    }
}
