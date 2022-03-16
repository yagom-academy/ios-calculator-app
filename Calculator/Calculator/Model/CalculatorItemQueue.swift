import Foundation

struct CalculatorItemQueue<item: CalculateItem> {
    private var enqueueList: [item] = []
    private var dequeueList: [item] = []
    var count: Int { dequeueList.isEmpty ? enqueueList.count : dequeueList.count }
    var first: item? { enqueueList.first }
    var last: item? { enqueueList.last }
    
    mutating func enqueue(_ item: item) {
        enqueueList.append(item)
    }
    
    mutating func dequeue() -> item? {
        if dequeueList.isEmpty {
            dequeueList = enqueueList.reversed()
            enqueueList.removeAll()
        }
        return dequeueList.popLast()
    }
}
