
import Foundation

enum QueueError: LocalizedError {
    case EmptyInLinkedList
    
    var errorDescription: String? {
        switch self {
        case .EmptyInLinkedList: return "There is no Node"
        }
    }
    
}
