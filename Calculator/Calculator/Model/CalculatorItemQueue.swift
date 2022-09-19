protocol CalculateItem { }

struct CalculatorItemQueue<T>: CalculateItem {
    private(set) var head: Node<T>? = nil
    private(set) var tail: Node<T>? = nil
    private(set) var count: Int = 0
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func enqueue(_ element: T) {
        let node = Node<T>(data: element)
        if isEmpty {
            head = node
        } else {
            tail = node
        }
        self.count += 1
    }
    
    func dequeue() -> T? {
        return nil
    }
    
    func peak() -> T? {
        return nil
    }
    
    func clear() {
        
    }
}

class Node<T> {
    var next: Node<T>?
    var data: T
    
    init(data: T) {
        self.data = data
    }
}
