struct CalculatorItemQueue<T>: CalculateItem {
    
    private var linkedList = LinkedList<T>()
    var count: Int {
        return linkedList.count
    }
    
    mutating func push(element: T) {
        linkedList.pushAfterTail(element: element)
    }
    
    mutating func pop() -> T? {
        return linkedList.popHead()
    }

    func peek() -> T? {
        return linkedList.peekHead()
    }
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    subscript (index: Int) -> T? {
        return linkedList[index]
    }
}
