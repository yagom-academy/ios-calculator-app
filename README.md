## iOS 계산기 앱 : 큐 타입 구현

iOS 계산기 앱 업데이트를 통해 Swift로 구현된 **큐 타입**을 도입하였습니다.

## CalculatorItemQueue

- 큐에서 요소를 **추가하고 제거하는 기능**을 지원하여 효율적인 데이터 관리를 가능하게 합니다.

## 프로토콜 준수

- 앱 아키텍처 내의 호환성과 확장성을 보장하기 위해 `CalculateItem` 프로토콜을 준수합니다.

## 테스팅

- 큐의 **기능성과 성능을 검증하기 위해** `CalculatorItemQueueTest`라는 전용 테스트가 생성되었습니다.

## 프로퍼티
- `head`: 큐의 첫 번째 노드를 가리킵니다.
- `tail`: 큐의 마지막 노드를 가리킵니다.
- `count`: 큐에 저장된 요소의 수를 반환합니다.
- `isEmpty`: 큐가 비어 있는지 여부를 반환합니다.

## 메소드
- `enqueue(_:)`: 큐의 끝에 새 요소를 추가합니다.
- `dequeue() -> Element?`: 큐의 첫 번째 요소를 제거하고 반환합니다. 큐가 비어 있으면 `nil`을 반환합니다.
- `prepend(_:)`: 큐의 시작 부분에 새 요소를 추가합니다.
- `insert(_:before:)`: 지정된 노드 앞에 새 요소를 삽입합니다. 지정된 노드가 `head`일 경우, `prepend(_:)` 메소드를 호출합니다.
- `first(matching:) -> Node?`: 주어진 값과 일치하는 첫 번째 노드를 찾아 반환합니다. 일치하는 요소가 없으면 `nil`을 반환합니다.
- `remove(node:)`: 지정된 노드를 큐에서 제거합니다.
- `removeAll()`: 큐의 모든 요소를 제거합니다.
- `printNode()`: 큐의 모든 요소를 콘솔에 출력합니다.

## Node 내부 클래스
- `value`: 노드가 저장하는 값입니다.
- `next`: 다음 노드를 가리키는 포인터입니다.

> `CalculatorItemQueue` 는 FIFO(First-In-First-Out) 원칙을 따라 구현되었습니다. 이 구조체는 제네릭을 사용하여 다양한 타입의 요소를 저장할 수 있습니다. `Equatable` 프로토콜 준수 요구사항은 요소 간 비교 연산을 가능하게 합니다.

## UML

<img src="https://github.com/kkomgi/ios-calculator-app/blob/step1/Calculator/Calculator/Resources/Images/queue_uml.jpg">

---
