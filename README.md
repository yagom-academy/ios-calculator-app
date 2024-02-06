## iOS 계산기 앱 : 큐 타입 구현

iOS 계산기 앱 업데이트를 통해 Swift로 구현된 **큐 타입**을 도입하였습니다.

## CalculatorItemQueue

- 큐에서 요소를 **추가하고 제거하는 기능**을 지원하여 효율적인 데이터 관리를 가능하게 합니다.

## 프로토콜 준수

- 앱 아키텍처 내의 호환성과 확장성을 보장하기 위해 `CalculateItem` 프로토콜을 준수합니다.

## 테스팅

- 큐의 **기능성과 성능을 검증하기 위해** `CalculatorItemQueueTest`라는 전용 테스트가 생성되었습니다.

## 메소드

- `enqueue(_:)`: 큐의 **끝에 요소를 추가**합니다.
- `dequeue()`: 큐의 **앞에서 요소를 제거**하고 반환합니다(있는 경우).
- `isEmpty()`: 큐가 **비어 있는지 확인**합니다.
- `clear()`: 큐의 **모든 요소를 제거**합니다.
- `getSize()`: 큐에 있는 **요소의 수를 반환**합니다.
- `contains(_:)`: 큐가 **특정 요소를 포함하고 있는지 확인**합니다.
- `toArray()`: 큐의 요소를 포함하는 **배열을 반환**합니다.
- `get(index:)`: 큐에서 **특정 위치의 요소에 접근**합니다.

## UML

<img src="https://github.com/kkomgi/ios-calculator-app/blob/step1/Calculator/Calculator/Resources/Images/queue_uml.jpg">

---
