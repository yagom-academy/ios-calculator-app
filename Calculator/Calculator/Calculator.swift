import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<Element>: CalculateItem {
    var linkedList = LinkedListManager<Element>(head: nil)
    
    func insertToQueue(_ insertValue: Element) {
        linkedList.addNewNode(insertValue)
    }
    
    func deleteFromQueue() throws -> Element {
        guard let deletedValue = linkedList.head?.nodeValue else {
            throw ErrorCase.emptyQueue 
        }
        linkedList.deleteFirstNode()
        return deletedValue
    }
}
