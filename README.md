## iOS 커리어 스타터 캠프 4. 계산기

### CalculatorItemQueue와 내부에 들어갈 Linked List의 관계를 나타낸 UML
![계산기 큐와 리스트](https://user-images.githubusercontent.com/102375432/168695203-b154fc18-385b-4dfb-894a-01314dc6782d.png)

---

### Step 1
* TDD 방법론에 기반하여 작업
* `Queue` 프로토콜 정의
* `CalculatorItemQueue` 구현
    * `Queue` 프로토콜에 부합하며, 배열을 활용해 구현
    * 내부에 들어가는 원소들은 `CalculateItem` 프로토콜에 부합

---

### Step 1 고민한 점
* TDD 방법론을 자료구조 구현 시의 타입 메서드 작성 시에도 적용하는 것이 맞을까?
* 처음에 테스트 코드를 짰을 때는 큐에 `Int`가 들어간다고 전제하고 짰지만, 이후 `CalculateItem`에 conform하게 만듬으로써 테스트 코드가 빌드가 되지 않았다. 이를 해결하기 위해 `CalculateItemTester`라는 임시 타입을 만들어서 테스트를 진행했는데, 이렇게 해도 괜찮을까?
* `enqueue` 메서드를 테스트할 때, 큐 내부의 배열을 들여다볼 방법이 없으므로 이미 검증된 후의 `dequeue` 메서드를 활용해서 테스트했다. 그러나 각각의 테스트 케이스는 독립적이어야 한다고 알고 있는데, 이 경우 어떻게 테스트를 진행하면 좋을까?
