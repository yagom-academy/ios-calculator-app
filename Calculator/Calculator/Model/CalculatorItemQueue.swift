import Foundation

struct CalculatorItemQueue<Element> {
    var linkedList = LinkedList<Element>(head: nil)
    
    func insertToQueue(_ insertValue: Element) {
        linkedList.addNewNode(insertValue)
    }

    @discardableResult
    func deleteFromQueue() throws -> Element {
        guard let deletedValue = linkedList.head?.nodeValue else {
            throw CalculatorError.emptyQueue
        }
        linkedList.deleteFirstNode()
        return deletedValue
    }
}
