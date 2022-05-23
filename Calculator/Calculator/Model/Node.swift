class Node<Item: CalculatorItem>: Equatable {
    var value: Item    
    var next: Node?
    
    init(_ value: Item) {
        self.value = value
    }
}

extension Node {
    static func == (lhs: Node<Item>, rhs: Node<Item>) -> Bool {
        return lhs.self === rhs.self
    }
}
