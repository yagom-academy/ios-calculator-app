# 계산기 프로젝트

## 프로젝트 소개
1. (STEP3 확인 후 작성 예정)

### 프로젝트 참여자
   - 팀원 : 애플사이다 @just1103
   - 리뷰어 : 찌루루 @jae57

### 프로젝트 일정
* STEP1 (1주차)
   - 11/08 (월) 스크럼, 프로젝트 확인, Linked List/Queue 구현
   - 11/09 (화) 스크럼, UML 작성, PR 요청
   - 11/10 (수) STEP1 개선
* STEP2 (1~2주차)
   - 11/11 (목) 사전 공부, Operator Enum/String Extension 구현
   - 11/12 (금) ExpressionParser Enum 구현
   - 11/14 (일) 사전 공부, ExpressionParser Enum 개선
   - 11/15 (월) Formula Struct 구현, 오류 처리, PR 요청
* STEP3 (2주차)

## STEP1
### 구현 내용
- 사용자가 계산기에 입력한 숫자 및 연산자를 Queue (CalculatorItemQueue 클래스)에 차례로 저장한다.
- Queue를 구현하기 위해 Linked List를 활용했다.
- TDD 방식으로 프로그래밍을 진행했다. XCTest를 통해 Test Case를 작성하여 테스트를 실행했다.

### UML

### 고려사항
* 기능
   - Queue를 사용하는 이유 : 계산기 프로그램에는 맨 앞과 맨 뒤를 삭제/추가하는 기능이 필요하며, 임의의 값을 탐색하지 않으므로 Queue가 적절하다.
   - Queue를 구현할 때 Array보다 Linked List가 적합한 이유 : Array의 removeFirst 메서드는 메모리 상에서 삭제한 요소 뒤에 위치한 요소들의 index를 모두 변경해야 하므로 성능이 낮다. (시간복잡도 O(n)) 반면 Linked List는 다음 요소를 가리키고 있는 포인터만 변경해주면 되므로 메모리 관리에 유리하다. (시간복잡도 O(1))
   - 계산기 프로그램에서 Queue에 저장할 숫자 및 연산자의 타입이 다르므로 (숫자는 Double 타입, 연산자는 함수 타입) 제네릭을 사용했다.

* 주요 프로퍼티 
   - head : Linked List의 첫 번째 노드를 가리킨다.
   - tail : Linked List의 마지막 노드를 가리킨다. (메서드 로직에서 마지막 노드를 찾는 경우가 빈번하므로 코드 중복을 방지하고자 생성했다.)
   - isEmpty : head가 있는지, 없는지 여부를 나타낸다.

* 주요 메서드
   - append : Linked List의 마지막에 새로운 노드를 추가한다.
   - removeFirst : Linked List의 첫 번째 노드 (head)를 제거 및 반환한다. (Queue에서 꺼낸 숫자 및 연산자를 사용하기 위해 반환타입을 지정했다.)
   - scanAllValue : 계산기 프로그램 작동에 직접 사용되지는 않지만, 테스트 코드에서 사용하기 위해 추가했다. 

* Test Case (LinkedList)
   - head/tail/isEmpty 프로퍼티 정상 반환 여부
   - append/removeFirst/scanAllValue/removeAll 메서드 정상 작동 및 반환 여부

* Test Case (CalculatorItemQueue)
   - enqueue/dequeue/scanAllValues/allClear 메서드 정상 작동 및 반환 여부

### 키워드
- TDD (Unit Test, XCTest), Data Structure (Queue/Linked List), Time Complexity, Generic, Inheritance, UML

## STEP2
### 구현 내용
- 사용자가 계산기에 입력한 숫자 및 연산자를 1개의 문자열로 받아 처리한다. 
- 문자열을 처리하여 숫자 및 연산자를 각각의 Queue에 할당한다. 제네릭 타입 매개변수를 각각 Double/Operator 타입으로 지정하여 별도의 Queue 인스턴스를 생성했다.
- Queue의 숫자/연산자를 차례로 꺼내어 사칙연산을 처리한다. (이번 프로젝트에서 연산자 우선순위는 무시한다.)

### UML

### 고려사항
* 기능
   - 숫자 및 연산자로 구성된 문자열 처리를 위해 Extension, Protocol을 활용했다.
   - 연산이 불가능한 경우 (ex. 0으로 나누기) 오류 처리를 했다.
   - 빈 Queue를 dequeue하는 경우 nil이 반환되므로 연산을 중지하도록 오류 처리를 했다.

* 주요 타입 및 메서드
   - Operator 열거형의 calculate : 연산자 (Operator case)에 따라 연산을 실행한다.
   - String Extenstion의 split : Character 타입을 전달인자로 받아 문자열을 분해하여 배열로 반환한다.
   - ExpressionParser의 componentsByOperators : 문자열을 연산기호 (Operator case의 원시값, Character 타입)로 분해하여 배열로 반환한다.
   - ExpressionParser의 parse : 문자열의 숫자 및 연산자를 구분하여 각각의 Queue에 할당하고, 해당 Queue를 프로퍼티로 갖는 Formula를 반환한다.
   - Formula의 result : Queue의 숫자/연산자를 차례로 꺼내어 사칙연산을 수행하고, 결과값을 반환한다. 

* Test Case (ExtensionsTests/OperatorTests/ExpressionParserTests)
   - 메서드의 정상 작동 및 반환 여부
* Test Case (FormulaTests)
   - 메서드의 정상 작동 및 반환 여부
   - 오류 처리 정상 작동 여부

### 키워드
- Higher-order function, String Manipulation, Protocol, Closure, Extension, Error Handling
