# 계산기 I 프로젝트 저장소

> 프로젝트 기간 2022.03.14 ~ 2022.03.25 </br>
팀원 : [@Lingo](https://github.com/llingo) / 리뷰어 : [@엘림](https://github.com/lina0322)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [STEP 1](#step-1)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [STEP 2](#step-2)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [STEP 3](#step-3)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [그라운드 룰](#그라운드-룰)
    + [활동 시간](#진행-방식)
    + [코딩 컨벤션](#코딩-컨벤션) 

---

## UML
### STEP 1 UML
<img width="500" alt="스크린샷 2022-03-15 오전 10 31 59" src="https://user-images.githubusercontent.com/94151993/158294801-13c102dd-69b2-4f25-ab3e-e9c9bb0f9b8a.png">

### STEP 2 UML
<img width="800" alt="6189d7537c82755a83c68a7d" src="https://user-images.githubusercontent.com/94151993/158860793-b0c46671-50be-4dc7-ad6b-534f1a9917fc.jpeg">

---

## [STEP 1]
### 고민 및 해결한 점

### 1. removeAll vs []
리스트를 직접 구현하기전에는 [Element] 배열을 사용하여 구현했었습니다. 그때 모든 원소를 삭제하는 방법으로 removeAll 메서드를 사용하거나 빈배열 [] 을 넣는 방법이 있었고 두 개의 차이가 무엇인지 궁금했습니다.
[StackOverFlow - Performance removeAll vs []](https://stackoverflow.com/questions/54133045/performance-array-removeall-vs) 를 참고한 후 [Swift - Array.swift](https://github.com/apple/swift/blob/ad50a39b120343f4827edb0a5a7013bb586306a6/stdlib/public/core/Array.swift#L1255)의 removeAll 구현 함수를 살펴보았더니 
만약, capacity를 유지하지 않으면 _Buffer() 를 할당해준다고 되어있었습니다. 
```swift
@inlinable
public mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
  if !keepCapacity {
    _buffer = _Buffer()
  }
  else {
    self.replaceSubrange(indices, with: EmptyCollection())
  }
}
```

_Buffer는 objc일 경우 _ArrayBuffer<Element>, 아닐 경우 _ContiguousArrayBuffer<Element> 의 타입 별칭이며 
_ContiguousArrayBuffer는 구조체로 선언되어있고 _ArrayBufferProtocol을 채택하고 있는 Array를 의미하여 결국 _buffer = _Buffer()는 새로운 Array를 넣어준다고 생각했고 capacity를 유지해야하는 경우가 아니라면 두 경우는 큰 차이가 없다고 이해했습니다.
```swift
#if _runtime(_ObjC)
@usableFromInline
internal typealias _Buffer = _ArrayBuffer<Element>
#else
@usableFromInline
internal typealias _Buffer = _ContiguousArrayBuffer<Element>
#endif
```

### 2. List를 직접 구현하는 과정에서 발생한 구조체 에러에 대해
직접 구현한 List의 Node를 구조체로 구현하려고 했을때 다음과 같은 에러가 발생했었습니다. 
```
Value type 'CalculatorNode<Element>' cannot have a stored property that recursively contains it
```
원인을 찾아보니 동적 메모리 영역인 힙을 사용하는 참조타입과 달리 구조체는 정적 메모리 영역인 스택만 사용하기 때문에 구조체는 컴파일 단계 에서 고정된 메모리 크기를 가지고 있어야하는데 Node 내부의 Node 내부를 프로퍼티로 가지게 되면 `Node[Node[Node[Node...` 로 무한한 크기를 가지게 되기 때문에 에러가 발생하는 것이었습니다. ([StackOverFlow - struct can't have stored property itself](https://stackoverflow.com/questions/53626802/struct-cannot-have-stored-property-that-references-itself-but-it-can-have-an-arr))

따라서, LinkedList는 구조체로 Node는 클래스로 `next` 프로퍼티를 통해 다음 Node를 참조하도록 구현했습니다.

### 3. UML 작성시 제네릭과 프로토콜의 관계 설정에 대해
각 타입의 제네릭 Element가 CalculateItem 프로토콜을 채택해야하는 상황인데 UML에서는 어떻게 그려야할 지 모르겠습니다.
저는 제네릭 Element의 데이터를 직접 담는 타입이 CalculatorNode의 data 프로퍼티이기 때문에 CalculatorNode에서 CalculateItem  프로토콜을 실체화 관계로써 작성했는데 엘림의 의견은 어떠한지 궁금합니다!

### 4. TDD를 처음 진행하면서 고민되었던 사항
**LinkedList의 front와 rear가 같은 인스턴스를 참조하는지 확인**하는 테스트를 작성하고 이를 통과하도록 구현하는 과정에서 front와 rear를 `internal`로 설정 했었는데 이후 리팩토링 과정에서 front와 rear를 `private`로 외부에서 접근을 못하도록 감춰야 된다면 위의 테스트 코드는 실패하게됩니다. 
이럴때 구현했던 테스트코드를 제거하는 것인지 `private(set)`을 사용해 front와 rear 프로퍼티를 `읽기전용`으로 변경하더라도 테스트 코드를 살려둬야하는지 궁금합니다. 저는 이번 PR에서는 `private(set)`으로 `읽기전용`으로 변경하여 테스트코드를 제거하지 않았습니다.

### 5. 기타
테스트 코드에서 테스트 함수에 `private`를 설정하면 테스트가 진행되지 않는다는 것을 모든 테스트 함수에 적용한 후에 알았습니다 🥲 

UML에서 보통 접근제어 표시를 `private: -`, `public: +`, `protected: #`으로 표기하지만 swift에는 protected 접근제어자가 없고 `private(set)`이라는 `읽기전용`이 있기 때문에 이번 프로젝트에서 #을 `private(set)`라는 의미로 표기했습니다.

---

## [STEP 2]
### 고민 및 해결한 점

### 1. UML 요구 조건 분석에서 어려웠던 점
이번 STEP 2는 UML이 주어졌기 때문에 각각의 타입과 메서드들이 하는 역할에 대해 코드를 구현하기전 분석이 필요했고 다음과 같은 고민이 있었습니다. 

먼저, String 타입에서 extension으로 구현해야하는 `split()`과 ExpressionParser 타입의 `componentsByOperators()`, `parse()` 메서드들을 어떻게 구현해야하며 왜 필요할까?

둘째, 처음에는 `"1+2x-1"`과 같이 입력이 붙어있는 경우로 생각했고 `x-1`와 같이 연산자와 음수값이 붙어있을때 어떻게 처리해야할까?

결론적으로 사용자 입력에서 연산자와 피연산자 사이에 한칸씩 띄워져 있다고 생각했습니다. 예를 들어, 사용자 입력 : "1 + 2 x -1" 이 들어왔다면,
1. `componentsByOperators()`에서 사용자 입력을 파라미터로 받고 `split()`메서드를 통해 `["1", "+", "2", "x", "-1"]`을 반환
(`componentsByOperators()`에서는 `split()`의 결과가 [""]과 같이 빈 문자가 요소로 있는 경우를 필터링합니다.)
2. `parse()`에서 앞선 단계에서 받은 `["1", "+", "2", "x", "-1"]`에서 **연산자**와 **피연산자**를 구분해서 새로 생성한 Formula 인스턴스의 큐에 각각 enqueue 하고 Formula 인스턴스를 반환하는 역할을 수행합니다.

### 2. 숫자를 0으로 나누는 경우에 대한 처리
숫자를 0으로 나누었을때 NaN(Not a Number)이 나와야하며 이를 어떻게 처리해야할 지에 대해 고민했습니다. Double.zero 와 같이 Double 타입에는 .nan이 존재하여 Operator의 divide 메서드 내부에서 `rhs == .zero` 일때 `.nan`를 반환하도록 하는 방법을 사용했습니다.
```swift
private func divide(lhs: Double, rhs: Double) -> Double {
  if rhs == .zero {
    return .nan
  }
  return lhs / rhs
}
```

### 3. 중복 들여쓰기를 하지 않도록 하려면 어떻게 구현해야할까?
기존 ExpressionParser 타입의 `parse()` 메서드의 **연산자**와 **피연산자**로 구분하는 로직에서 이중 if 문(들여쓰기)을 사용해서 구현했었습니다. 하지만, 이번 프로젝트의 요구 조건에는
```
코드 들여쓰기를 2번을 초과하지 않습니다.
예) if문 안의 if문은 들여쓰기를 두 번 한것입니다.
```
가 명시되어 있기 때문에 **중복 들여쓰기를 해결할 방법**에 대해 생각했고 __함수형 프로그래밍__ 을 사용하여 해결했습니다.
```swift
// 기존
static func parse(from input: String) -> Formula {
  var formula = Formula()
  let inputString = self.componentsByOperators(from: input)
  inputString.forEach {
    if let number = Double($0) {
      formula.operands.enqueue(number)
    } else if let operation = Operator(rawValue: Character($0)) {
      formula.operators.enqueue(operation)
    }
  }
  return formula
}
```

inputString이라는 변수명을 result로 네이밍을 변경하고 result를 forEach로 순회할때 if 문으로 분기처리해줬던 로직을
filter, compactMap으로 전처리를 해준 결과를 forEach로 순회하는 방법으로 리팩토링했습니다.

```swift
// 개선 (리팩토링)
static func parse(from input: String) -> Formula {
  var formula = Formula()
  let result = self.componentsByOperators(from: input)
  result
    .compactMap { Double($0) }
    .forEach {
      formula.operands.enqueue($0)
    }
  result
    .filter { Double($0) == nil }
    .compactMap { Operator(rawValue: Character($0)) }
    .forEach {
      formula.operators.enqueue($0)
    }
  return formula
}
```

### 4. 기타 (STEP 1 PR의 피드백)
- STEP 1 PR의 피드백을 통해 의존성 주입에 대해 잘못 알고 있던 오개념을 바로 잡을 수 있었습니다! 😃
- 구조체에서 생성자를 extension에 구현할 때와 안할 때의 차이점에 대해 알 수 있었습니다
- `mutating` 과 `final` 키워드에 대해 더 자세히 알 수 있었습니다.
- 타입을 명시하고 안하는 것에 대한 기준을 잡자.
- 테스트 코드는 성공/실패하는 케이스를 골고루 작성하자.
- 테스트 코드를 작성할 때 모든 것을 테스트하는 것도 중요하지만 `무엇을` `왜` `어떻게`를 생각해봐야한다. 😅



---

## [STEP 3]
### 고민 및 해결한 점

`TBD`

---

## 그라운드 룰
### 진행 방식
- 매일 아침 9시 - 23시 (with: 중간에 식사나 휴식)
- UML 설계 후 TDD 방법론에 따른다.
- 중간에 발생하는 트러블슈팅을 노션에 기록한다.
- 칸반보드와 이슈를 사용한다.

---

### 코딩 컨벤션
### 1. Swift 코드 스타일
코드 스타일은 [스타일쉐어 가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88) 에 따라 진행한다.

### 2. 커밋 메시지
**2-1. 커밋 Titie 규칙**
```
feat: 새로운 기능의 추가
fix: 버그 수정
docs: 문서 수정
style: 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
refactor: 코드 리펙토링
test: 테스트 코트, 리펙토링 테스트 코드 추가
chore: 빌드 업무 수정, 패키지 매니저 수정(ex .gitignore 수정 같은 경우)
```

**2-2. 커밋 Body 규칙**
```
현재 시제를 사용, 이전 행동과 대조하여 변경을 한 동기를 포함하는 것을 권장
문장형으로 끝내지 않기
subject와 body 사이는 한 줄 띄워 구분하기
subject line의 글자수는 50자 이내로 제한하기
subject line의 마지막에 마침표(.) 사용하지 않기
body는 72자마다 줄 바꾸기
body는 어떻게 보다 무엇을, 왜 에 맞춰 작성하기
```
