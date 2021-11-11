protocol CalculateItem {
    
}

struct CalculatorItemQueue<Element>: CalculateItem {
    var linkedList = LinkedListManager<Element>(head: nil)
    
    func insertToQueue(_ insertValue: Element) {
        linkedList.addNewNode(insertValue)
    }
    
    func deleteFromQueue() {
        guard linkedList.head?.nodeValue != nil else { return }
        linkedList.deleteFirstNode()
    }
}


