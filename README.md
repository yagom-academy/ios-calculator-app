# 🧮 계산기

> 계산이요.

**Index**
- [Ground Rule](#GroundRule)
- [Time Line](#TimeLine)
- [Step1](#Step1)

<a name="GroundRule"></a>
# 🤝  의존 모둠 Ground Rule

<a name="TimeLine"></a>
# ⏰  타임 라인

**21.11.08.Mon**

- Step1 요구사항 파악
- Queue, LinkedList 자료구조 공부
- TDD 복습
- 테스트 타겟 설정 및 초기 타입 구현
- Step1 기한 설정

**21.11.09.Tue**

- UML 작성
- Queue 구현
- TDD 방식으로 Queue Test
- 코드 Refactoring
- Step1 PR 제출
- [README.md](http://readme.md/) 작성

<a name="Step1"></a>
# 1️⃣ Step 1

## 📊 Step1 UML

<img width="700" alt="image" src="./image/step1UML.png">

Step 1 요구사항에 맞게 빈 프로토콜과, Queue 구현

## 🎯 Step1 구현 내용

- TDD를 위한 Test case 생성
- 향후 Step을 위한 빈 프로토콜 `CalculatorItem`
- `CalculatorItem`을 채택하는 `CalculatorItemQueue`생성
- 향후 큐를 여러 타입으로 사용하기 위해 `CalculatorItemQueue`을 Generic 타입으로 생성
- Queue를 DoubleStack 방식으로 구현

## 🤔 Step1 고민했던 점

- 큐 타입을 만들고 다음 스텝에서 구현할 Queue에 만들어놓은 Queue를 써주려했다. 숫자와 연산자의 Queue가 필요하다고 생각하였는데 그러러면 각 타입이 Int, String이여야 했고, 이를 위해 각 타입별 Queue를 만드는 것은 굉장히 비효율적이라고 생각하여 **타입에 제한을 두지않고 재사용하여 코드의 중복도 줄일 수 있는 Generic**을 활용해 Queue 타입을 생성

- Queue 타입은 **구조체**를 택했습니다. 그 이유는 프로토콜만 채택하고, 굳이 상속할 필요도 없고 또한 상속 받을 것도 없었기때문에 이 점때문에라도 클래스를 굳이 택할 이유가 없지않나? 하고 결정

- Generic 타입 파라미터명을 뭐라고 해야하는지 고민되었다. 해당 파라미터명은 보통 T, U, V같은 하나의 대문자를 사용하지만, Array의 경우 Element(요소)와 연관된 의미와 규칙이 있으므로, 명확함을 주기위해 사용된다고 [공식문서]([https://docs.swift.org/swift-book/LanguageGuide/Generics.html#ID183](https://docs.swift.org/swift-book/LanguageGuide/Generics.html#ID183))에서 보았다. 현재 프로젝트에서 생성한 Queue 또한 Element와 관련이 있다고 생각하여 타입 파라미터명을 Element로 지정해주었다.

## 🙇‍♂️ Step1 배운 점

### Genenric

- 타입에 제한을 두지않고 재사용하여 코드의 중복도 줄일 수 있음
- 의도가 명확한 코드를 작성할 수 있다.</br>

### DoubleStack을 이용한 Queue

<img width="500" alt="image" src="./image/queue_doubleStack.png">

**Queue**를 하나의 **Array**로 만든다면, 첫번째 요소를 제거하려 ```removeFirst()```를 호출할텐데 공식문서를 보면 **시간복잡도가 O(n)**인 모습을 볼수 있다.</br>

<img width="795" alt="image" src="https://user-images.githubusercontent.com/70251136/141065484-4a565fb2-e6a5-4fe3-a3da-615198ef476e.png">

이는 첫번째 요소가 빠지고 그 뒤의 요소들이 앞으로 당겨지는 과정에서 발생하는 비용으로 인한 것이다.

그래서 그러한 단점을 보완한 **DoubleStack** 즉, **Array** 2개를 이용해 단점을 보완한다

하나의 **Array**에 먼저 **enqueue** 하여 요소를 넣어주고 **dequeue**할 때 다른 Array에 ```reversed()```를 이용하여 넣어준다면 첫번째 배열의 첫번째 요소가 두번째 배열에선 마지막 요소가 되기에 **dequeue**하여 요소를 뺄 때 첫번째 요소를 뺴서 뒤의 요소들이 앞으로 당겨지는 비용이 쓰이지 않게 되어 시간복잡도가 O(1)이 되고, 요소가 많아도 비용이 늘지 않게 되는 것이다.
