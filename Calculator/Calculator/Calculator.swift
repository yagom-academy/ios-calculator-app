import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<Element> {
    var linkedList = LinkedListManager<Element>(head: nil)
    
    func insertToQueue(_ insertValue: Element) {
        linkedList.addNewNode(insertValue)
    }
    
    @discardableResult
    func deleteFromQueue() throws -> Element {
        guard let deletedValue = linkedList.head?.nodeValue else {
            throw ErrorCase.emptyQueue 
        }
        linkedList.deleteFirstNode()
        return deletedValue
    }
}
