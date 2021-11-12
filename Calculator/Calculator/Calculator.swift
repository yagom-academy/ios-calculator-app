import Foundation

protocol CalculateItem {
    
}

extension Double: CalculateItem {
    
}

struct CalculatorItemQueue<Element>: CalculateItem {
    var linkedList = LinkedListManager<Element>(head: nil)
    
    func insertToQueue(_ insertValue: Element) {
        linkedList.addNewNode(insertValue)
    }
    
    func deleteFromQueue() -> Element {
        guard let deletedValue = linkedList.head?.nodeValue else {
            return fatalError() as! Element   // 에러처리 구문 추가할 때 수정 예정
        }
        linkedList.deleteFirstNode()
        return deletedValue
    }
}


