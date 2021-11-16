class LinkedListNode {
    let value: CalculateItem
    private(set) var nextNode: LinkedListNode?
    
    init(value: CalculateItem) {
        self.value = value
    }
    
    func link(nextNode: LinkedListNode) {
        self.nextNode = nextNode
    }
}
