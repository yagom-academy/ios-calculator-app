protocol CalculateItem { }

struct CalculatorItemQueue<T>: CalculateItem {
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil
    private(set) count: Int = 0
    var isEmpty: Bool {
        return count == 0
    }
    
    func enqueue(_ element: T) {
        
    }
    
    func dequeue() -> T? {
        
    }
    
    func peak() -> T {
        
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
