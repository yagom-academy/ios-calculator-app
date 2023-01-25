struct CalculatorItemQueue: CalculateItem {
    // 계산기를 만들 때 자료구조형으로 array가 유리할까 list가 유리할까?
    // array는 요소를 찾을 때 효율이 좋고 list는 생성이나 삭제 수정할때 효율이 좋다고 한다.
    // 계산기는 요소를 찾는것보다는 삭제 수정해야 하는경우가 있으므로 또 사용자가 계산을 얼마나 할지 예측할 수 없기 때문에 가변적인 list가 좋다고 생각함
    
    // 연산자 우선순위를 지킨다고 가정했을때 무슨 자료구조가 더 필요할까? 고민했습니다.
    
    // queue 배열 하나에 숫자와 부호를 담을게 아니라 숫자 따로 부호 따로 담는 방법은? 범용성이 나쁜건 아니지만 예기치못한 변수 발생을 예방하기 위해서 지양해야할거 같음
    
    // queue에 숫자와 부호를 담는다면 타입이 다른걸 한 array에 담아야 하기 때문에 제네릭과 any 타입이 생각남.
    // 제네릭은 언어가 제공하는 특징이고 any는 타입의 일종, 제네릭은 타입을 한정할 때 사용하고 any 타입은 모든 타입을 임의로 사용하기 위해 사용
    // 제네릭 기반으로 생성된 타입은 특정 타입으로 정해져 있기 때문에 안전하게 사용할 수 있고, any 타입은 접근할 때 마다 타입 캐스팅을 해줘야 하는 번거로움이 있다.
    
    // 아니면 queue에 숫자와 부호를 전부 String 타입으로 담고 연산할때만 숫자만 Int 형변환을 해주면 어떨까
    private var queue: [T] = []
    
    // 배열에 요소 하나를 뒤에 추가한다.
    mutating private func enqueue(element: T) {
        queue.append(element)
    }
    
    // 빈 배열을 한칸 지우라고 하면 에러가 나기 때문에 배열이 비었는지 확인용도
    mutating private func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    // 배열에 첫번쨰 요소를 삭제한다. 만약 stack 타입이였다면 마지막에 들어온값을 지워야함으로 removeLast()를 사용했겠지
    // 이렇게 지울 경우 array는 list와 다르게 index를 한칸씩 당겨야 하므로 O(1)에서 O(n)으로 속도가 늘어나게 된다.
    mutating private func dequeue() -> T {
        return isEmpty() ? nil : queue.removeFirst()
    }

    // 배열의 모든걸 삭제 계산기의 AC 버튼 역할
    mutating private func clearQueue(element: T) {
        queue.removeAll()
    }
    
}
