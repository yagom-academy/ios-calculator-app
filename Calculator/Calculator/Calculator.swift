import Foundation

class CalculatorItemQueue<T>: ManageLinkedList<T> {
    var itemQueue = [T]()
    
    init(itemQueue: [T]) {
        self.itemQueue = itemQueue
    }
    
    var isEmpty: Bool {
        itemQueue.isEmpty
    }
    
    func putToQueue(_ value: T) {
        itemQueue.append(value)
    }
    
    func getFromQueue() {
        guard isEmpty == false else {
           return print("Error: Queue가 비어있습니다.")
        }
        itemQueue.removeFirst()
    }
}

class Node<T> {
    let value: T
    var pointer: Node?
    
    init(value: T, pointer: Node?) {
        self.value = value
        self.pointer = pointer
    }
}
    
class ManageLinkedList<T> {
    var head: Node<T>?
    
    func enQueue(value: T) {
        if head == nil {
            head = Node(value: value, pointer: nil)
            return
        }
        
        var finderNodeOfEndNode = head
        while finderNodeOfEndNode?.pointer == nil {
            finderNodeOfEndNode = finderNodeOfEndNode?.pointer ?? nil
        }
        finderNodeOfEndNode?.pointer = Node(value: value, pointer: nil)
    }
    
    func deQueue() {
        head = head?.pointer
    }
    
}


