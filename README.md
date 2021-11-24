## 야곰 아카데미 iOS 커리어 스타터 캠프

### 💾 계산기 프로젝트

- 프로젝트 기간: [2주] 2021-11-08(월) ~ 2021-11-19(금)
- Contributor: 예거(@Jager-yoo)
- Reviewer: 흰(@daheenallwhite)

## 📍 UML

![image](https://user-images.githubusercontent.com/71127966/142184085-9d2a2636-2cbe-415e-a184-9ad84443f54f.png)

- <계산기> 프로젝트의 요구사항에서 제시된 전체 `UML` 을 코드를 구현하며 직접 그려봤습니다.

- CalculateItemQueue 구조체의 `제네릭`이 프로토콜을 준수하고 있지만, 이는 외부에서 주입되는 요소이기 때문에, UML 에서 `실체화 관계`(Realization)로 연결하지 않았습니다.

- 반면 Operator 와 Double 타입은 CalculateItem 프로토콜을 준수하고 있으므로 `실체화 관계`로 연결했습니다.

- Formula 구조체의 프로퍼티는 CalculateItemQueue 타입을 참조하므로 `직접 연관 관계`(Directed Association)로 연결했습니다.

- ExpressionParser 열거형의 `parse` 메서드가 Formula 타입을 생성하고 리턴하기 때문에, Formula 구조체와 `의존 관계`(Dependency)로 연결했습니다.
parse 메서드의 호출이 끝나면 Formula 구조체와의 관계가 마무리됩니다.

- private, private(set) 접근제어가 붙은 프로퍼티나 메서드에는 `-` 기호를 붙였습니다. internal 접근제어는 아무 기호도 붙이지 않았습니다.

- 타입 프로퍼티/메서드(static)에는 `밑줄(underline)`이 들어간다는 걸 [UML Class Diagrams Reference](https://www.uml-diagrams.org/class-reference.html) 에서 확인했습니다.
그래서 ExpressionParser 열거형의 두 메서드에는 밑줄을 적용했습니다.

- 요구사항을 살펴보다가, CalculateItem 프로토콜과 Double extension 의 클래스 상자 제목 부분이 _이탤릭체(italic)_ 로 되어있는 걸 발견했습니다.
[UML Class Diagrams Reference](https://www.uml-diagrams.org/class-reference.html) 을 검색해보니, `추상화 클래스`의 제목은 _이탤릭체_ 로 표기한다는 내용이 있더라구요.
위 UML 에서, CalculateItem 프로토콜과 Double extension 은 둘 다 비어있고 추상화를 위해서만 사용되므로, _이탤릭체_ 로 표기했습니다.

> [Abstract Class] The name of an abstract class is shown in italics.
---

## 🛠 STEP 2 중요 구현 내용

### ✅ divide 메서드에서 0으로 나누는 경우, 에러를 던지기 보다는 Double.nan 을 반환하도록 구현
- 에러 타입을 만들어서 여기서 에러를 던져줘도 되지만, 0 으로 나눴을 때 에러는 `모델`이 아닌 `ViewController` 에서 처리하도록 만들고 싶었습니다.

- 숫자 0 을 표현할 때, 하드코딩을 피하기 위해 `Double.zero` 프로퍼티를 활용했습니다.

```swift
private func divide(_ lhs: Double, _ rhs: Double) -> Double {
    switch rhs {
    case .zero:
        return Double.nan
    default:
        return lhs / rhs
    }
}
```

### ✅ Formula 구조체의 result 메서드는 수행해야 하는 연산의 횟수를 기준으로 switch문으로 케이스를 나눠 접근
-  연산 횟수(operatorsCount)가 1번인 경우 -> `Subscript` 로 queue 의 값을 읽어서 calculate 메서드로 계산하여 결과값을 반환합니다.

- 연산 횟수가 2번 이상인 경우 -> 최초 계산을 `partialResult`라는 변수에 저장한 뒤, `for문`으로 Subscript 숫자를 올려가며, 연속적으로 계산이 이루어지도록 구현했습니다.

- default -> 연산 횟수가 0번인 경우는 계산기에서 숫자를 입력하고 아무 연산자도 누르지 않고 바로 `[=]` 버튼을 누르는 경우입니다.
이 경우엔 연산이 이뤄지지 않도록 `ViewController` 에서 처리할 예정입니다. (일단 Double.nan 을 반환하게만 해놨어요.)

```swift
func result() -> Double {
    let operatorsCount = operators.queue.count
        
    switch operatorsCount {
    case 1:
        return operators.queue[0].calculate(operands.queue[0], operands.queue[1])
    case 2...:
        var partialResult: Double = operators.queue[0].calculate(operands.queue[0], operands.queue[1])
        for i in 1...(operatorsCount - 1) {
            partialResult = operators.queue[i].calculate(partialResult, operands.queue[i+1])
        }
        return partialResult
    default:
        return Double.nan
        // 계산기에 찍힌 숫자 그대로 재출력 (ex. 숫자는 입력하고, 연산자 안 누르고 = 누른 경우엔 그 숫자를 그대로 보여줌)
    }
}
```

### ✅ String 타입 extension 의 split 메서드는 String 에서 공백(" ")을 기준으로 숫자와 연산자를 모두 분리해주는 역할로 구현
- 저는 계산기 View 에서 String 입력값을 받을 때, 각 연산자와 숫자 사이에 공백(" ")이 들어오도록 구현하려고 합니다.

- 왜냐면 `마이너스` 때문인데요, Operator.subtract 의 rawValue 가 `"-"` 인데, 음수의 기호도 `"-"` 를 사용하고 싶었습니다.

- String 이 `"123.3--20"` 이런 식으로 들어올 경우, 연산자 추출 로직이 복잡해질 것 같더라구요.
차라리 `"123.3 - -20"` 이렇게 들어오면, 공백을 기준으로 [String] 배열로 분리시키면 편할 거라 판단했습니다.
  - "123.3 - -20" -> ["123.3", "-", "-20"]

- 캠퍼들끼리 View 를 살펴보다가, subtract 의 기호와 음수의 기호가 각기 다른 특수문자라는 걸 듣기도 했지만, 유사하게 생긴 각기 다른 기호를 사용하면 제가 몇 달 뒤에 이 코드를 봤을 때 헷갈릴 거라는 생각이 들더라구요.

### ✅ ExpressionParser 열거형의 componentsByOperators 메서드는 filter 고차함수를 활용해 연산자만 골라 반환
- 한 번 split 메서드를 통과하고 나온 [String] 타입에 `filter 고차함수`와 contains 메서드를 활용해서 연산자만 골라내 [String] 타입으로 반환하도록 구현했습니다.

```swift
private static func componentsByOperators(from input: String) -> [String] {
    let operatorRawValues = Operator.allCases.map { $0.rawValue.description }
    let whiteSpace: Character = " "
    let splitedInput = input.split(with: whiteSpace)
        
    return splitedInput.filter { operatorRawValues.contains($0) }
}
```

### ✅ ExpressionParser 열거형의 parse 메서드는 숫자와 연산자 배열을 만들고 Formula 구조체의 멤버와이즈 이니셜라이저 형태로 반환
- 배열 전체에 `Double($0)` 을 적용하면, 숫자는 통과하고, 연산자는 `nil`로 변환되는데요, `compactMap 고차함수`를 통해 통과한 숫자들만 골라냈습니다.

- 연산자 배열을 만들 때는 Operator 열거형의 `rawValue` 와 매치시켜 열거형의 case 로 변환시켰습니다. 

```swift
static func parse(from input: String) -> Formula {
    let whiteSpace: Character = " "
    let splitedInput = input.split(with: whiteSpace)
    let rawValueOperators = componentsByOperators(from: input)
    let operands = CalculatorItemQueue(queue: splitedInput.compactMap { Double($0) })
    let operators = CalculatorItemQueue(queue: rawValueOperators.compactMap { Operator(rawValue: Character($0)) })
        
    return Formula(operands: operands, operators: operators)
}
```

---

## 🛠 STEP 1 중요 구현 내용

- 유닛 테스트를 먼저 작성하며 `TDD`방식으로 접근
- 계산기에서 사용하는 연산 버튼은 4개뿐이므로, 사칙연산자(➕, ➖, ✖️, ➗)는 열거형으로 분리
- 큐타입은 `제네릭`을 활용해서 구현
- `제네릭`과 열거형은 CalculateItem 프로토콜을 준수하도록 만들어서, 의도하지 않은 타입으로 큐타입의 인스턴스가 만들어지지 않도록 함
- 타입이 담기는 배열은 인스턴스 프로퍼티로 구현하고 `private(set)` 접근제어 부여 -> 테스트 케이스에서 배열의 값을 읽을 수 있도록 함
- `enqueue` 메서드는 `append`로 배열의 끝에 원소 추가
- `dequeue` 메서드는 배열이 비어있다면(isEmpty) `nil`을 반환하고, 비어있지 않다면 `removeFirst`를 통해 첫 원소를 배열에서 삭제 후 반환
  - removeFirst 메서드의 `시간복잡도`가 `O(n)`인 점을 알지만, 계산기 프로젝트에서 dequeue 메서드를 호출할 경우가 많지 않을 것 같아 간단하게 구현
  - 만약 시간복잡도를 낮춰야 한다면, 임시로 사용할 빈 배열에 `reversed` 메서드로 원소들의 순서를 뒤집어서 할당하고 마지막 원소를 삭제, 반환한 뒤, 다시 reversed 메서드로 뒤집어서 기존 배열에 재할당하면 됨
