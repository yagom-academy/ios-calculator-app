//  Created by bella on 2022/09/19.

struct CalculatorItemQueue<T> {
    var queue: [T?] = []
    // 제네릭을 넣어주어 테스트를 진행했으나, 두개의 값이 비교가 되지 않아, 비교가 가능한 타입으로 바꾸어주었다.
    // 다시 제네릭으로 돌아옴..ㅋㅋㅋ
    private var head: Int = 0
    // 디큐하고 한칸씩 땡겨오는방법대신 다른방법을 쓰고자해서 일단 헤드를 만듦
    
    mutating func enqueue(element: T) {
        queue.append(element)
    }

    mutating func count() -> Int {
        return queue.count-head
    }
    
    mutating func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    mutating func clear() {
        queue.removeAll()
    }
    
    mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        
        if head > queue.count/2 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}

