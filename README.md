## 🏕 iOS 커리어 스타터 캠프

## ➕➖✖️➗ 계산기 프로젝트

> 프로젝트 기간: 2022-03-14 ~ 2022-03-25 (11days)  
팀원: 개인프로젝트 / 리뷰어: [hyunable](https://github.com/hyunable)

## 목차
- [UML](#UML)
- [STEP 1](#STEP-1)
- [STEP 2](#STEP-2)
- [STEP 3](#STEP-3)

## UML
![UML](https://i.imgur.com/m9l0ku9.png)

## STEP 1

### 고민한 점

#### Queue를 구현하는 방법에 대해

> 방법1: 그냥 array 사용

- 장점: 간단함
- 단점: dequeue시 O(n)으로 굉장히 비효율적이어서 탈락

> 방법2: Double Stack Queue 구현

- 장점: 효율적인 큐 구현가능, 비교적 간단함

> 방법3: LinkedList 사용해서 구현

- 장점: 효율적인 큐 구현가능
- 단점: 코드량이 상당히 많음, class인 node와 prev, next를 관리하는 overhead가 있음

2번 3번 둘다 상관 없을것 같아서, 그냥 LinkedList로 해보기로 했습니다

#### 어떤 LinkedList를 사용할지

제가 생각했던 구조는 head와 tail이 있고, dummy node두개가 있는 구조입니다  
처음에는 단방향 연결리스트로 구현하였는데, append 매서드 구현이 불가능하여 양방향 연결리스트로 변경하였습니다  

또한 아직 프로젝트에서 왜 queue를 구현하라고 했는지 이해를 하지 못했습니다
계산기에서 CE를 누르면, 가장 최신 피연산자를 지워야하는데, 오히려 stack이 맞지 않나? 라고 생각했습니다. 추후 프로젝트를 진행하면서 이유를 알게 될것이라고 생각합니다

만약 removeLast() 연산이 추가적으로 필요하다면, 현재 양방향 연결리스트이므로 deque으로의 리팩토링도 훨씬 수월할것 같습니다

#### Node와 LinkedList와 CalculatorItemQueue를 Class 로 할지 Struct로 할지

애플은 기본적으로 struct를 권장하고 있습니다. 그래서 저는 타입을 정할때, 기본적으로는 struct로를 선택하고 무조건 class를 써야하는 이유가 있거나, mutating이 너무 빈번하면 class를 쓰는 편입니다

Node의 경우 struct로로 선언했을때, value타입은 자신과 동일한 타입을 저장프로퍼티로 가질수 없다는 에러가 떴습니다

> The answer is in your question: structs are value types. If you include a substruct B into a struct A, it means, that one object of type A will have a size sizeof(all_other_fields_of_A) + sizeof(B). So, a value type can not be recursive: it would have infinite size.

값 타입의 경우, 자신이 자신을 저장프로퍼티로 가지고 있을 경우, 해당 구조체의 size는 무한이 되어서 그렇다고 합니다..!

LinkedList와 CalculatorItemQueue는 그럴 이유를 전혀 찾지 못해서 둘다 struct로 구현하였습니다

#### TDD 진행방식에 대한 어려움

Node를 만들고, LinkedList와 CalculatorItemQueue를 선언하자 코드 작성순서에 대한 고민이 생겼습니다

Queue에 대한 검증함수를 만들고 싶은데, 그러면 Queue에 대한 테스트 함수를 만든후, Queue에서 함수 작성을 하고, LinkedList에서 함수 작성까지 해야합니다

ex) enqueue에 대해서 검증하고 싶다면..?
- enqueue에 대한 test함수를 만들고
- queue에서 enqueue를 구현하고
- linkedList에서 append를 구현해야 함

중간에 커밋을 끊기도 애매하고(완성되지 않았으므로), 그렇다고 한번에 하자니 이것도 아닌것같고.. ㅠㅠ  
결국 LinkedList를 테스트 함수를 구현하며 TDD로 작성하였고, Queue를 다시 Test 함수를 구현하면서 TDD로 작성하였습니다  
그러다보니 사실상 Queue는 LinkedList를 Wrapping한 형태인데, 검증 코드를 두번씩 작성하는것이 너무 마음에 들지 않았습니다  

요약)
- 검증 코드는 Queue에만 구현하고, 내부적으로 사용하는 LinkedList는 암시적으로 검증되게 하고 싶었습니다(마치 private 매서드 처럼요!)
- 하다보니 위와 같은 이유로 잘 되지 않았습니다.. ㅠㅠ

지금 생각해보니, LinkedList 부터 작성하되, LinkedList에 대해서는 검증함수를 작성하지 말고, Queue를 구현할때, 검증함수를 작성하는 방법도 있었을것 같습니다.

이 부분에 대해 조언을 주실 수 있을까요?

### 피드백 후 개선한 점

### 배운 개념

- 구조체는 동일한 타입을 저장프로퍼티로 가질 수 없다/ 이유까지
- TDD 작성의 어려움 (현실적으로 왜 완벽할 수 없는지)

## STEP 2

### 고민한 점
### 배운 개념
### 피드백 후 개선한 점

## STEP 3

### 고민한 점
### 배운 개념
### 피드백 후 개선한 점
