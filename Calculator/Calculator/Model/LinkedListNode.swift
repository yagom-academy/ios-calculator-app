class LinkedListNode<Value> {
    let value: Value
    private(set) var nextNode: LinkedListNode<Value>?
    
    init(value: Value) {
        self.value = value
    }
    
    func link(nextNode: LinkedListNode<Value>) {
        self.nextNode = nextNode
    }
}
