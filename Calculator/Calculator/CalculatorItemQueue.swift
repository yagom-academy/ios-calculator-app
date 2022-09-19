//  Created by bella on 2022/09/19.

struct CalculatorItemQueue<T> {
    var queue: [Int] = []
    // 제네릭을 넣어주어 테스트를 진행했으나, 두개의 값이 비교가 되지 않아, 비교가 가능한 타입으로 바꾸어주었다.
    private var head: Int = 0
    
    // 반환타입 없으니까, 변수에 값 할당 안됨!!!!
    mutating func enqueue(element: T) {
        guard let newElement = element as? Int else { return }
        queue.append(newElement)
    }
}
