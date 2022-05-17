struct CalculatorItemQueue<T>: CalculateItem {
    
    private var linkedList = LinkedList<T>()
    
    mutating func push(element: T) {
        linkedList.pushAfterTail(element: element)
    }
    
    mutating func pop() -> T? {
        return linkedList.popHead()
    }

    func peek() -> T? {
        return linkedList.peekHead()
    }
}
