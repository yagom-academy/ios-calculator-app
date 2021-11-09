
import Foundation

struct CalculatorItemQueue<Element>: CalculateItem {
    private(set) var inBox = [Element]()
    private(set) var outBox = [Element]()
    
    var front: Element? {
        return outBox.last ?? inBox.first
    }
    
    var count: Int {
        return outBox.count
    }
    
    var isEmpty: Bool {
        return inBox.isEmpty && outBox.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        inBox.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if inBox.isEmpty && outBox.isEmpty {
            return nil
        }
        
        if outBox.isEmpty {
            outBox = inBox.reversed()
            inBox.removeAll()
        }
            
        return outBox.removeLast()
    }
    
    mutating func clear() {
        inBox.removeAll()
        outBox.removeAll()
    }
}
