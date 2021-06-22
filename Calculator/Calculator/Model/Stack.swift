import Foundation

struct Stack {
    var storedValue: [String] = []
    
    mutating func pop() -> String {
        guard let popedValue = self.storedValue.popLast() else {
            return "error"
        }
        
        return popedValue
    }
    
    mutating func push(element: String){
        self.storedValue.append(element)
    }
    
    func peek() -> String? {
        guard let peekedValue = self.storedValue.last else {
            return "error"
        }
        
        return peekedValue
    }
}
