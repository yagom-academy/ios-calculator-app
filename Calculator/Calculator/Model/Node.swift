class Node<Item: CalculatorItem> {
    var value: Item    
    var next: Node?
    var previous: Node?
    
    init(_ value: Item){
        self.value = value
    }
}
