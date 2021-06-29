import Foundation

struct Stack<Element> {
    var items: [Element] = []
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    func top() -> Element? {
        return items.last
    }
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
}
