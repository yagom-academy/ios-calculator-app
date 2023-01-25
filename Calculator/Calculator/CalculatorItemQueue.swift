struct CalculatorItemQueue<T>: CalculateItem {

    private var queue: [T] = []
    
    // 삽입
    // 배열에 요소 하나를 뒤에 추가한다.
    mutating func enqueue(element: T) {
        queue.append(element)
    }
    
    // 검사
    // 빈 배열을 한칸 지우라고 하면 에러가 나기 때문에 배열이 비었는지 확인용도
    mutating func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    // 삭제
    // 배열에 첫번쨰 요소를 삭제한다. 만약 stack 타입이였다면 마지막에 들어온값을 지워야함으로 removeLast()를 사용했겠지
    // 이렇게 지울 경우 array는 list와 다르게 index를 한칸씩 당겨야 하므로 O(1)에서 O(n)으로 속도가 늘어나게 된다.
    mutating func dequeue() -> T? {
        return isEmpty() ? nil : queue.removeFirst()
    }

    // 삭제
    // 배열의 모든걸 삭제 계산기의 AC 버튼 역할
    mutating func clearQueue() {
        queue.removeAll()
    }
    
    mutating func searchQueue() -> T? {
        return queue.first
    }
    
}
