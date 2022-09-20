//  Created by bella on 2022/09/19.

struct CalculatorItemQueue<T> {
    var queue: [T?] = []
    // 제네릭을 넣어주어 테스트를 진행했으나, 두개의 값이 비교가 되지 않아, 비교가 가능한 타입으로 바꾸어주었다.
    // 다시 제네릭으로 돌아옴..ㅋㅋㅋ
    private var head: Int = 0
    
    // 반환타입 없으니까, 변수에 값 할당 안됨!!!!
    mutating func enqueue(element: T) {
        queue.append(element)
    }
    
    mutating func count() -> Int {
        return queue.count
    }
}


// 포문돌려서 안에잇는 녀석들이 Int인지...하나씩 담아주자
// 근데 그것을 위해서는 본래 메서드에서 해주는것인가!
