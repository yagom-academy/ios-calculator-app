# ➗✖️ 계산기 ➕➖

> 프로젝트 기간 :  2023.05.29 ~ 2023.06.09


## 📖 목차

1. [소개](#1.)
2. [팀원](#2.)
3. [타임라인](#3.)
4. [다이어그램](#4.)
5. [실행 화면](#5.)
6. [트러블 슈팅](#6.)
7. [참고 링크](#7.)
8. [팀 회고](#8.)

<br>

<a id="1."></a>

## 1. 📢 소개

    사용자로부터 입력받은 숫자와 연산자를 활용하여 순차적으로 연산을 진헹합니다.
   - 주요 개념: `UIKit`, `Queue`, `Double-stack`

<br>

<a id="2."></a>

## 2. 👤 팀원

| [Serena 🐷](https://github.com/serena0720) |
| :--------: |
| <Img src = "https://i.imgur.com/q0XdY1F.jpg" width="450"/>|

<br>

<a id="3."></a>
## 3. ⏱️ 타임라인

|날짜|내용|
|:---:|---|
| **2023.05.29** |▫️  UnitTest 타겟설정<br>▫️ CalculatorItemQueue 큐타입 정의<br>▫️ CalculateItem 프로토콜 정의|
| **2023.05.30** |**TDD** <br> ▫️ enqueue함수 테스트 및 생성 <br>▫️ enqueueForString 함수 테스트 및 생성
| **2023.05.31** |**TDD** <br>▫️ Double Extension 생성<br> ▫️ isEmpty 테스트 및 생성<br>▫️ peek 테스트 및 생성<br>▫️ dequeue 함수 테스트 및 생성 및 리턴타입 변경|
| **2023.06.01** |▫️ Calculator Class Diagram|
| **2023.06.04** |▫️ Any타입배열에서Generic으로타입변경 <br> ▫️ Calculatorltem의Element에Calculateltem프로토콜상속 <br> ▫️ peek 프로퍼티 수정 |
| **2023.06.05** |▫️ extension Double, String 생성 <br> ▫️ Formula 구조체 생성 <br> ▫️ Operator enum 생성 <br> ▫️ ExpressionParser enum 생성 <br> ▫️ split 함수 수정 |
| **2023.06.06** |▫️ Formula의 result 함수 수정 <br> ▫️ Error enum case 생성  <br> ▫️ CalculatorItemQueue result함수 및 조건 수정 <br> ▫️ substract의 Hypen Minus를 Minus Sign으로 수정 <br> ▫️ componentsByOperators 함수 수정 <br> ▫️ parse 함수 수정 <br> ▫️ allOperatorRawValues 프로퍼티 생성|
| **2023.06.07** |▫️ parse함수, componentsByOperators 함수 수정 <br> ▫️ targetArray의 map함수 수정 <br> ▫️ stringParts "" 값 출력 삭제 filter 함수 추가 <br> ▫️ 0으로 나눴을 때 오류 throw <br> ▫️ voidNumber 에러 추가 <br> ▫️ Formula에서 error 캐치 <br> ▫️ ExpressionParser, Formula Unit Test 구현|
| **2023.06.08** |▫️ Operate의 divide 에러 처리 삭제 <br> ▫️ Formula의 operators의 타입 변경 및 에러처리 변경 <br> ▫️ componentsParts 타입 변경 <br> ▫️ CalculatorItemQueue의 타입 변경 <br> ▫️ ExpressionParserTests의 test 구현|
| **2023.06.09** |▫️ dividedByZero 에러 조건 수정 |



<br>

<a id="4."></a>
## 4. 📊 다이어그램
<Img src = "https://hackmd.io/_uploads/BkbdkLxw2.png" width="550"/>




<br>

<a id="5."></a>
## 5. 📲 실행 화면

(추후 업로드 예정)

<br>

<a id="6."></a>
## 6. 🛎️ 트러블 슈팅

### 🔥 효율적인 Queue 구현 방법이 어떤 것일까?
- Queue를 구현하기 위해 크게 4가지 방법을 공부했습니다. 이 중 어떤 구현 방법을 선택해야할지에 대한 고민을 했습니다.
- 먼저 시간 복잡도에 대한 고민을 했습니다. 각 로직별로 시간 복잡도가 다르다는 것을 알게되었습니다. 하여 어떤 구현 방법을 사용했을 때 가장 효율적일 수 있는 지를 가장 먼저 고민했습니다.
- 두번째로 계산기라는 어플의 흐름에 어떤 구현 방법이 어울릴까를 고민했습니다. 계산기는 사용자가 입력한 숫자를 순차적으로 받고, 이의 결과값을 출력해주는 것이 가장 주된 기능 흐름이라 생각했습니다. 이런 흐름에 어떤 구현 방법이 어울릴지 고민했습니다.

1. Array를 사용하는 방법
    - 시간 복잡도 : 인덱스의 순서가 있는 Array에 `.append`를 사용하여 요소를 enqueue하고, `.removeFirst`를 사용하여 맨 앞의 인덱스를 dequeue하는 방식으로 queue를 구현할 수 있습니다. 하지만 이때 enqueue의 시간복잡도는 O(1)이지만, dequeue의 시간복잡도는 O(n)이 됩니다. 맨 앞의 인덱스를 dequeue 시 모든 인덱스의 순서를 하나씩 앞으로 땡겨야하기 때문입니다. 즉 `.removeFirst`를 사용하여 dequeue 시 시간복잡도가 높아진다는 문제점이 존재합니다. 
    - 기능 흐름 : 계산기의 기능적 흐름을 구현하기에 적합하다고 생각했습니다.
    - 결론 : dequeue의 시간복잡도 문제만 제외하면 구현 방법도 간단하고, 기능 흐름에도 적합할 수 있는 방법이라 생각했습니다.

2. 임의의 head를 생성하여 배열 요소의 dequeue index를 지정하는 방법
    - 시간 복잡도 : 위와 enqueue의 방식은 동일하지만, 임의의 `head`가 가리키는 인덱스를 변경만 하는 방법이기 때문에 dequeue 시 시간 복잡도를 O(1)로 만들 수 있다는 장점이 있습니다. 하지만 head를 옮기면서 삭제된 인덱스의 값은 nil로 수정하게 되고, 결국 이 nil의 값들은 축적이 될 것입니다. 하여 이를 임의로 삭제해주는 추가 작업이 있어야 한다는 번거로움이 있습니다.
    - 기능 흐름 : 계산기의 기능적 흐름을 구현하기에 적합하지 않다고 생각했습니다. 계산기는 단순 작업 어플이 되어야한다고 생각했습니다. 위의 nil값이 축적되는 부분이 이러한 계산기의 특성과는 다소 어울리지 않을 수 있다는 생각을 했습니다.
    - 결론 : dequeue 시 생기는 nil의 값을 처리하는 부분이 해결된다면 좋은 방법이라고 생각했습니다.

3. Double Stack을 활용하는 방법
    - 시간 복잡도 : 이 방법은 기존의 array와 동일하게 enqueue를 진행하지만 dequeue를 진행하는 방법에서 차이를 보입니다. dequeue 시 2개의 Array를 사용하여 stack의 특성인 `Last-in-First-out`을 구현합니다. 기존의 배열을 뒤집어 새로운 배열에 저장한 뒤 기존의 배열을 삭제하고 `.popLast`를 사용하여 뒤집힌 배열의 마지막요소를 추출합니다. dequeue 시 `.popLast`를 사용함으로 시간 복잡도는 O(1)로 줄일 수 있습니다. 하지만 기존의 배열을 뒤집어서 새 배열에 할당하는 작업의 시간복잡도가 O(n)이기 때문에, 이를 사용하는 경우 시간 복잡도가 높아진다는 단점이 있습니다. 즉 이 방법은 조건별 시간 복잡도가 다르다는면에서 효율적인 방법이 아니라고 생각될 수 있습니다.
    - 기능 흐름 : 계산기의 기능적 흐름을 구현하기에 적합하다고 생각했습니다.
    - 결론 : 조건 별 시간 복잡도가 높아질 수 있다는 부분을 제외하면 좋은 방법이라 생각했습니다.

4. LinkedList 형태로 구현하는 방법
    - 시간 복잡도 : LinkedList 중에서도 단방향 연결 리스트 방법을 고민했습니다. 이 방법을 통해 enqueue와 dequeue를 하게 되면, 특정 노드의 연결 주소값을 변경하고 값을 변경하는 식으로 진행되기 때문에 시간 복잡도가 높지 않을 것이라 생각됩니다. 하지만 값을 접근할 경우 속도가 느린 점, 메모리 공간을 많이 차지할 수 있다는 점도 고민을 해봐야한다고 생각했습니다.
    - 기능 흐름 : 계산기의 기능적 흐름을 구현하기에 적합하다고 생각했습니다.
    - 결론 : 저는 계산기에 입력되는 마지막 값에 접근을 할 경우가 존재할 것이라 생각했습니다. 이런 부분에서 LinkedList는 마지막 인덱스에 접근할 때 시간복잡도가 O(n)으로 높기 때문에 적합한 방법은 아니라 생각했습니다.
-> 사실 시간 복잡도와 기능흐름 중 시간 복잡도에 대한 고민을 중점적으로 했습니다. Double Stack이 가장 시간 복잡도 측면에서 효율적일 수 있다는 확신이 들지 않아 고민을 하던 차에 아래 블로그를 참고하였습니다. 이 블로그에 따르면 Double Stack의 시간 복잡도가 가장 낮다는 것을 확인할 수 있었습니다. 하여 저는 Double Stack을 활용하여 코드를 진행하고자 했습니다.
- [📘 Blog: Queue in Swift](https://woongsios.tistory.com/222)
      
      
### 🔥 UML기반으로 역할 고민
- 기존과 달리 UML 기반으로 코드를 짜다보니, 흐름을 이해하는 데 시간이 오래 걸렸습니다. 바로 코드로 정리하는 것이 어려워서 UML에 기재된 내용을 틀만 구현하고 그 안의 내용을 하나씩 생각해내는 방식으로 코드를 구현하였습니다.

    <details>
    <summary>코드 구현 전 고민 과정</summary>

    ### Operator.swift
    이 함수가 어떤 동작을 하는지?
    input : string에서 숫자와 연산자를 나눈 것을 각각의 배열로 받아
    처리 : 숫자의 배열에서 맨앞의 값, 두번째값을 각각 받아서 계산 함수에 넣기
        : 연산자 배열의 맨앞의 값을 받아서 Operator의 case와 비교하여 Operater의 calculate에 넣기!

    이 함수가 어떤 결과를 리턴하는지?
    연산자의 종류별로 계산 결과값을 ExpressionPaser에 전달!

    어떤 의도로 코드를 짤 것인지?
    저 enum case를 활용해서 더이상 switch 구문을 만들고 싶지 않다!
    그렇다고 if를 미친듯이 돌리고 싶지도 않다!
    그럼 enum case안에 있는 rawvlue 값을 비교할 수 있는 방법에 뭐가 있을까?
    filter로 하려고 하니까 enum case안에 있는 rawValue값을 배열로 만들어야할듯 싶은데,,,어떻게 할까?
    enum명(rawValue: “rawValue값”) → enum case에서 rawValue를 기준으로 선택 가능!!!

    ```swift
    Operator(rawValue: Character(operators.deque!))
    ```


    ### Formula.swift

    1+2-3 인 경우를 고려해봐라
    숫자[1,2,3] 연산자[+,-]
    숫자 첫요소 = lhs, 두번쨰 요소 = rhs 에 넣고
    연산자에서 첫요소 = modifier
    result에 결과값을 넣게 되면 3
    이 3을 받아서
    연산자에서 첫요소 - / 숫자에서 첫요소 3을 받아서
    추가 연산 행동을 해야한다
    이때의 문제점 1. 결과값을 다시 lhs로 받아야한다
    이때의 문제점 2. 두 배열이 모두 빈 배열이 될 때까지 위 행동을 반복해야한다.

    1-1+3
    [1,1,3] [-,+]
    1 = lhs 1= rhs
    result = 0
    rhs = 3

    조건 반복시킬 때 어떤 것으로 할까?
    for 구문 -> CalculatorItemQueue의 queue가 private이기 때문에 count를 만들어서 받음
    while -> 조건에 따라서 돌리기때문에 배열의 요소의 갯수에 따라 해야하기때문에 부적절 -> isEmpty
    foreach -> 횟수제한이 안된다 -> collction 타입에서 모든 요소를 다 꺼내서 계산

    </details>

### 🔥 `split` vs `component`
- 두 메소드가 문자열을 쪼갠다는 부분에서 같은 기능을 수행한다고 볼 수 있기 때문에 어떤 것을 사용해야할지 고민을 했습니다. `components`의 경우 `seperator`기준으로 문자열을 분리하여 `[String]형태로 반환합니다. 하지만 숫자를 나누는 경우 처음과 끝부분에 ""와 같은 빈 값이 배열안에 추가 됩니다. 하여 `components`를 사용할 시 이 부분을 유의해야합니다.
- 이와 달리 `split`은 파라미터가 총 3종류가 있으며, `String`으로 매개변수를 받는 `components`와 달리 `character` 타입으로 매개변수를 받는다. 또한 반환값도 `[Substring]`의 형태를 띈다는 차이가 있습니다. 하여 반환값을 String으로 다운캐스팅을 해야한다는 불편함이 있습니다. 이 두 메소드의 특징을 참고하여 코드 작성 시 상황별로 어떤 메소드를 사용할지 고민했습니다.

### 🔥 `substring`
- 위의 split을 공부하면서 `substring`이라는 개념을 처음 접하게 되었습니다. `substring`은 `string`을 쪼갠 점에서 `charactor`와 유사하지만 `string`의 주소값을 공유하기 때문에 작업이 빠르고 효율적이라는 장점이 있습니다.

### 🔥 `map`
- 이번 프로젝트를 진행하면서 고차함수들을 접할 일이 많았습니다. `map`을 그 중 가장 활용도가 높은 함수라서 적극적으로 활용해보고자 노력했습니다.

### 🔥 `substract`의 Hyphen Minus를 Minus Sign으로 수정
- 계산기 조건 중 음수에 대한 조건이 있어서 고민을 많이 했습니다. 이때 `Hypen Minus`(-)와 `Minus Sign`(−)은 동일한 모양을 띄지만 다른 값을 갖고 있습니다. 이 점을 사용하여 부호의 값을 `Minus Sign`으로 주어 `Hypen Minus`를 사용하는 음수를 음수 자체의 값으로 넘겨서 계산될 수 있도록 사용했습니다.


<br>


<a id="7."></a> 
## 7. 🔗 참고 링크
- [🍎 Apple Docs: Generic Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/#Generic-Types)
- [🍎 Apple Docs: Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
- [🍎 Apple Docs: Character](https://developer.apple.com/documentation/swift/character)
- [🍎 Apple Docs: Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ViewswithIntrinsicContentSize.html#//apple_ref/doc/uid/TP40010853-CH13-SW1)
- [📘 Blog: 큐 구현하기](https://babbab2.tistory.com/84)
- [📘 Blog: Swift로 구현한 Queue 와 더블스택](https://apple-apeach.tistory.com/8)
- [📘 Blog: 단방향 연결 리스트(LinkedList) 구현 해보기](https://babbab2.tistory.com/86)
- [📘 Blog: 제네릭 (Generics)](https://jusung.gitbook.io/the-swift-language-guide/language-guide/22-generics)
- [📘 Blog: removeAllvs[]](https://limjs-dev.tistory.com/92)


<br>

<a id="8."></a>
## 8. 💭 회고
### 👏🏻 잘한 점
- 프로젝트를 진행하기 전에 관련 공부를 성실하게 선행하였습니다.
- 막히는 부분이 있을 때 주위에 도움을 구하였습니다.
- 도움을 받은만큼 제 스스로 다른 사람을 도와줄 수 있는 부분을 찾아서 도움을 주고자 노력했습니다.
        
### 👊🏻 개선할 점
- 단시간에 많은 내용을 학습하다보니 아직 개념을 완벽하게 이해하지 못한 거 같아서 아쉬웠습니다.
- 프로젝트의 타임라인을 완벽히 충족시키지 못했습니다.
