import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    private var data = LinkedList<T>()
    
    public mutating func enqueue(element: T) {
        data.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard let pop = data.removeHead() else { return nil }
        
        return pop
    }
    
    public func peek() -> T? {
        guard let peek = data.peekData() else { return nil }
        return peek
    }
    
    public mutating func clear() {
        data.removeAll()
    }
    
    public mutating func insert(_ element: T, at: Int) {
        data.insert(element, at: at)
    }
    
    public mutating func removeAtIndex(_ at: Int) {
        _ = data.remove(at: at)
    }
    
    public var count: Int {
        return data.count
    }
    
    public var isEmpty: Bool {
        return data.isEmpty
    }
}
