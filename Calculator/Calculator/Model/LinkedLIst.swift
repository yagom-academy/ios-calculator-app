import Foundation

struct LinkedList<T> {
    private var head: LinkedListNode<T>?//첫번째노드를가리킬head
    private var tail: LinkedListNode<T>?//마지막노드를가리킬tail
    var count: Int = 0
    
    func isEmpty() -> Bool {
        return self.head == nil
    }
    
//    mutating func addNode(data: T?) -> LinkedListNode<T>? {
//        if head == nil || tail == nil {
//            head = LinkedListNode.init(data: data)
//            tail = head
//            return head
//        }
//        let newNode = LinkedListNode.init(data: data)
//        tail?.next = newNode
//        newNode.prev = tail
//        tail = newNode
//        return tail
//    }
}
