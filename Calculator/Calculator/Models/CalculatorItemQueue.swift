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
        switch linkedList[index] {
            
        case .success(let data):
            return data
            
        case .failure(let error):
            switch error {
            case .listIsEmpty:
                print("Fatal error: Array is empty")
            case .indexOutOfRange:
                print("Fatal error: Array index is out of range")
            }
            return nil
        }
    }
}

extension CalculatorItemQueue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self.init()
        elements.forEach { self.push(element: $0) }
    }
}

extension CalculatorItemQueue: Sequence, IteratorProtocol {
    mutating func next() -> T? {
        linkedList.next()
    }
}

extension CalculatorItemQueue: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
        let stringArray = self.map { "\($0)" }
        let returnString = stringArray.joined(separator: ", ")
        return "[" + returnString + "]"
    }
    
    var debugDescription: String {
        let stringArray = self.map { "\($0)" }
        let returnString = stringArray.joined(separator: ", ")
        return "[" + returnString + "]"
    }
}
