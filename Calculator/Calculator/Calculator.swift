protocol CalculateItem {
    
}

class CalculatorItemQueue<Element>: LinkedListManager<Element>, CalculateItem {
    func insertToQueue(_ insertValue: Element) {
        super.addNewNode(insertValue)
    }
    
    func deleteFromQueue() {
        guard self.head?.nodeValue != nil else { return }
        super.deleteFirstNode()
    }
}


