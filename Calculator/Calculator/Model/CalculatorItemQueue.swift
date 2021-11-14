import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var items: LinkedList<T> = LinkedList<T>(head: nil)

    mutating func enqueue(value: T) {
        items.append(value: value)
    }

    mutating func dequeue() -> T? { // 빈 큐에서 dequeue 하면 오류처리를 해야 할까?
        let removedValue: T? = items.removeFirst()
        return removedValue
    }

    mutating func scanAllValues() -> [T] {
        let allValues: [T] = items.scanAllValues()
        return allValues
    }

    mutating func allClear() {
        items.removeAll()
    }
}

