import Foundation

struct LinkedList<T> {
    private var head: LinkedListNode<T>?//첫번째노드를가리킬head
    private var tail: LinkedListNode<T>?//마지막노드를가리킬tail
    
    mutating func isEmpty() -> Bool {
        return self.head == nil
    }
    
    mutating func addNode(data: T) {
        if head == nil || tail == nil {
            head = LinkedListNode<T>()
            tail = head
            return
        }
        let newNode = LinkedListNode<T>()
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
        return
    }
}
