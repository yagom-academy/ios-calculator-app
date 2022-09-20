//  Created by bella on 2022/09/19.

struct CalculatorItemQueue<T> :  CalculateItemProtocol {
    var queue: [T?] = []
    
    private var head: Int = 0
    
    mutating func enqueue(element: T) {
        queue.append(element)
    }

    mutating func count() -> Int {
        return queue.count-head
    }
    
    mutating func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    mutating func clear() {
        queue.removeAll()
    }
    
    mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        
        if head > queue.count/2 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}

