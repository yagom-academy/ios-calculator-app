import Foundation

struct CalculatorItemQueue<item: CalculateItem> {
    private var enqueueList: [item] = []
    private var dequeueList: [item] = []
    var count: Int { enqueueList.count }
    var first: item? { enqueueList.first }
    var last: item? { enqueueList.last }
    
    mutating func enqueue(_ item: item) {
        enqueueList.append(item)
    }
}
