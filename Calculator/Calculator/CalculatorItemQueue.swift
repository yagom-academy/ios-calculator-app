//  Created by Aejong on 2022/09/21.

struct CalculatorItemQueue: CalculateItem {
    
    var queue: [String] = []
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: String) {
        queue.append(element)
    }
    
    mutating func dequeue() -> String? {
        return isEmpty ? nil : queue.removeFirst()
    }
}
