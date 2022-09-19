protocol CalculateItem { }

struct CalculatorItemQueue<T>: CalculateItem {
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil
    private(set) var count: Int = 0
    var isEmpty: Bool {
        return count == 0
    }
    
    func enqueue(_ element: T) {
        
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
