import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue<T: CalculateItem> {
    let items: LinkedList<T> = LinkedList<T>(head: nil) // private(set) var에서 let으로 수정

    func enqueue(value: T) {
        items.append(value: value)
    }

    func dequeue() -> T? {
        let removedValue: T? = items.removeFirst()
        return removedValue
    }

    func scanAllValues() -> [T] {
        let allValues: [T] = items.scanAllValues()
        return allValues
    }

    func allClear() {
        items.removeAll()
    }
}

