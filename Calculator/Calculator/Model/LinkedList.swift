import Foundation

class LinkedList<T> {
    var head: LinkedListNode<T>?
    var tail: LinkedListNode<T>?
    var isEmpty: Bool {
        head == nil
    }

    func addNode(data: T) {
        let newNode = LinkedListNode<T>(data: data)
        if isEmpty {
            head = newNode
            tail = head
        } else {
        tail?.next = newNode
        tail = newNode
        }
    }
    
    func removeFirstNode() -> T? {
        if isEmpty {
            clear()
            return nil
        } else if head?.next == nil {
            let headNode = head
            clear()
            return headNode?.data
        } else {
        let node = head
        head = head?.next
            return node?.data
        }
    }
    
    private func clear() {
        head = nil
        tail = nil
    }
}
