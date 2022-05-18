class Node<Item: CalculatorItem> {
    var value: Item    
    var next: Node?
    
    init(_ value: Item){
        self.value = value
    }
}
