import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    private var data = [T]()
    
    public mutating func enqueue(element: T) {
        data.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    public func peek() -> T? {
        return data.first
    }
    
    public mutating func clear() {
        data.removeAll()
    }
    
    public mutating func insert(_ element: T, at: Int) {
        data.insert(element, at: at)
    }
    
    public mutating func removeAtIndex(_ at: Int) {
        data.remove(at: at)
    }
    
    public var count: Int {
        return data.count
    }
    
    public var isEmpty: Bool {
        return data.isEmpty
    }
    
    public var isFull: Bool {
        return data.count == data.capacity
    }
    
    public var capacity: Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
}
