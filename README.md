# Calculator
## 목차
---


## iOS 커리어 스타터 캠프

### 계산기 프로젝트
---
- 프로젝트 기간: 2021.11.08 - 2021.11.19
- 커밋 기준: 기능 단위 (카르마 규칙 준수)
    - Step1: #1(Model), #2(Error), #3(Read Me), #4(Refactoring)
    - Step2: #5(Model), #6(Read Me), #7(Test), #8(Refactoring)
    - Step3: #9(Model), #10(Refactoring) #11(Read Me)

### 🗝️ 키워드 
---
- `Array` `시간복잡도`
- `Queue`
- `Generic` `T` `Element`
- `TDD` `UnitTest`
- `UML`
- `map` `compactMap`
- `split` `components`
- `scrollView`
- `stackView`
- `NumberFormatter`

### 🖌️ UML 
![](https://i.imgur.com/YOL74g2.png)


## 1️⃣ Step 1
---
### 🤔 Step 1에서 고민했던 부분 
___
#### 1. 한 배열 안에 연산자와 숫자를 함께 넣어줘야할지 고민했습니다. 
Generic 타입으로 한꺼번에 CalculatorItemQueue를 생성해주고 난 후 연산자와 숫자 각각에 대한 타입을 생성해주었습니다. 
하나의 배열에 다양한 타입을 넣으려고 한다면 [Any]를 사용해야 하는데 이 경우 Equatable 프로토콜을 준수하고 있지 않아 Unit Test에도 어려움이 있었습니다. 또한 값을 빼낼 때에도 타입을 분리해서 빼내야 하는 어려움이 있어 각각 타입을 생성하는 방법을 선택했습니다. 


#### 2. 입력 값이 Int와 Double일 때 따로 처리를 해줄지 고민했습니다. 
전부 Double로 입력받아 숫자의 형식을 정해주는 방법을 선택했습니다. (아직 형식을 정해주는 부분은 구현하지 않음)

#### 3. 아래의 코드를 개선할 수 있는 방법을 고민했습니다. 
```swift 
struct CalculatorItemQueue: CalculateItem {
    var number = CalculatorQueue<Double>().queue
    var `operator` = CalculatorQueue<Character>().queue
    
    mutating func appendItem<T>(_ input: T) {
        if input is Double {
            number.append(input as! Double)
        } else if input is Character {
            `operator`.append(input as! Character)
        } else if input is Int {
            let input = input as! Double   
        }
    }
}

struct CalculatorQueue<Element>: CalculateItem {
    var queue: [Element] = []
}
```
 
**위 코드의 문제점**
- 배열에 값을 추가해줄 때 Generic을 사용했는데, 여기서 배열의 타입이 두 종류라 타입을 확인하고 타입에 맞는 배열에 넣어줘야 했습니다. 이 경우 input이 기본적으로 Generic 타입이기 때문에 강제로 다운캐스팅을 해줘야 하는 문제가 있었습니다. 
- Unit Test를 진행할 때 input에 `1`이나 `"+"`를 넣어준다면 Double이나 Character로 인식하지 않고 Int나 String으로 인식하는 문제가 있었습니다. 이를 위해 extension을 활용해 불필요한 코드를 작성해야 하는 문제가 있었습니다. 
```swift
extension Int {
    var doubleValue: Double {
        return round(Double(self))
    }
}
```

이런 문제를 해결해주기 위해 일단 `CalculatorItemQueue`를 제너릭으로 구현을 해준 뒤 연산자는 `CalculatorItemQueue<Character>`로, 피연산자는 `CalculatorItemQueue<Double>`로 각각 생성해주었습니다. 

#### 4. Generic을 표시할 때 `T`로 표시할지 `Element`로 표현할지 고민했습니다. 
[Generic 공식문서](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)를 보면 배열에 대한 Generic을 생성할 때에는 `T`가 아닌 `Element`를 사용해서 `Element`를 사용하도록 했습니다. 

#### 5. Array를 사용할 때 시간복잡도에서 단점을 갖고 있다는 점을 알고, 이를 어떻게 해소시킬 수 있을지 고민했습니다. 
Array를 Queue 방식을 통해 값을 빼준다면 제일 처음 들어온 값부터 빠지게 됩니다. 따라서 첫 번째 배열 값이 비워지고 차례로 하나씩 당겨지게 됩니다. 이 때 시간복잡도에서 단점(O(n))을 가지게 됩니다. 
(단순히 검색 및 접근을 할 때에는 O(1)의 시간 복잡도를 갖게 된다.)

배열을 `reversed()`하게 되면 O(1)의 시간 복잡도를 가지게 되고 마지막 값을 뺀다면 값을 당길 필요도 없다고 생각하여 `reversed()`를 한 후 배열의 마지막 값을 빼고 다시 `reversed()`를 해줘서 원래대로 바꾸는 방법을 선택했습니다. 

(이 과정에서 Linked List에 대해 알게 되었는데 이에 대해 추가적인 학습이 필요함을 느꼈습니다)

---
### 💡 Step 1에서 보완한 부분 및 새롭게 안 내용
---
#### 1. 프로젝트 미니멈 타겟이 iOS 14.1로 되어있는데 현재 아이폰 사용자의 OS 점유율은 어떨까?
현재 85%의 기기가 iOS 14를 사용하고 있으며, 4년 동안 도입된 기기의 90%가 iOS 14를 사용 중입니다.
이는 해당 [링크](https://developer.apple.com/kr/support/app-store/)에서 확인할 수 있습니다. 
버전에 따라 제공되는 기능에 차이가 있기 때문에 버전을 수정할 때는 항상 side effect를 고려해야 합니다. 

#### 2. Queue를 담는 배열의 네이밍 수정 
기존에는 단순히 array라는 이름을 사용했습니다. 
하지만 Swift의 [API design Guidelines](https://www.swift.org/documentation/api-design-guidelines/#naming)를 보면 `Name variables, parameters, and associated types according to their roles, rather than their type constraints.` 이런 문장이 있습니다. 

즉, 타입 명을 직접 언급하는 것보단 역할에 대해 작성해야 한다고 판단했습니다. 

그래서 연산자와 피연산자의 items라는 네이밍으로 수정했습니다. 특히 배열의 경우 공식문서에서 복수로 표현하고있어 `items`로 정했습니다.

#### 3. Unit Test의 네이밍에 대해 고민했습니다. 
테스트가 하나의 코드의 스펙 정의 문서가 될 수 있다고 생각하기 때문에 그 코드를 많이 볼 사람들에 맞춰 네이밍을 하는 것이 가장 좋지 않을까 생각했습니다. 
(정말 글로벌하게 협업을 한다면 영어로 네이밍하는 것이 더 적합하다고 판단했습니다. 다만 협업 대상이 한국인에 한정된 경우 한글로 사용하는 것이 오히려 나을 수 있다고 생각합니다)

테스트 명의 경우 Naming을 하면서 간략한 것보다 구체적이 좋다는 Guideline을 보고 '최대한 구체적으로 적어서 네이밍만 보더라도 어떤 테스트인지 알 수 있는 것이 좋지 않을까?'' 라고 생각해서 최대한 구체적으로 표현하려고 했습니다.

#### 4. removeAllItem의 함수명 수정 
all 뒤에는 복수형이 붙는 것이 영어 문법 상 맞는 표현이라 removeAllItems로 수정했습니다. 

<br/>


## 2️⃣ Step 2
---
### 🤔 Step 2에서 고민했던 부분 
___
#### 1. `CalculateItem` 프로토콜을 어디에 채택하면 좋을지 고민했습니다. 
`CalculatorItemQueue`의 제네릭 타입에 프로토콜을 채택하는 것이 가장 적합하다고 생각했습니다. 타입에 채택을 하게 되면 타입에는 `Operator` 열거형과 `Double`만 들어올 수 있게 되고 다른 타입의 인스턴스를 생성할 수 없어 가장 타당하다고 판단했습니다. 

#### 2. `ExpressionParser`가 왜 케이스가 없이 구현된 것인지 고민했습니다. 
열거형을 싱글톤처럼 사용하기 위함이라 생각합니다. 열거형의 경우 따로 인스턴스를 생성할 수 없습니다. 
따라서 함수를 `static`으로 타입 메서드를 생성하면 파일 전체에서 연산자와 피연산자를 분리하는 `parse` 메서드를 싱글톤처럼 호출할 수 있기 때문에 타입 메서드로 구현했습니다. 
```swift=
static func parse(from input: String) -> Formula {
    var formula = Formula()
    let operandsItems = componentsByOperators(from: input).compactMap { Double($0) }
    let operatorsItems = input.compactMap { Operator(rawValue: $0) }
        
    formula.operands.items = operandsItems
    formula.operators.items = operatorsItems
        
    return formula
}
```

#### 3. 연산자 배열과 피연산자 배열을 어떻게 분리할 지 고민했습니다. 
피연산자 배열의 경우 `Double` 배열, 연산자 배열의 경우 `Operator` 타입의 배열로 생성해야했습니다.
또한 음수의 경우 마이너스를 연산자가 아닌 피연산자로 인식해야 했습니다. 

먼저 operandsItems의 경우 `String`을 `Double`로 변환해야 했습니다. 이 때 `map`을 사용하게 되면 변환이 되면서 옵셔널 Double 타입으로 변환이 되기 때문에 `compactMap`을 사용했습니다. 

또한 operatorsItems의 경우 `String`을 `Operator`로 변환해야 했습니다. 또한 Operator 열거형의 rawValue에 해당하는 값만 꺼내와야 했기에 `let operatorsItems = input.compactMap { Operator(rawValue: $0) }` 이렇게 구현했습니다. 
변환이 되지 않아 nil로 된 값은 제거해줘야 했기에 `compactMap`을 사용했습니다. 


또한 음수와 연산자를 구분하기 위해 연산 가능한 minus와 연산이 불가능한 minus를 나눠서 String으로 값을 받도록 했습니다.
먼저 `.replacingOccurrences`메서드를 활용해 연산자를 `" "`로 수정해줬고 이를 토대로 extension으로 구현한 `split` 메서드를 활용해 쪼갠 뒤 map을 활용해 연산이 안되는 minus를 연산 가능한 minus로 수정했습니다. 

`let convertOperands = operands.map { $0.replacingOccurrences(of: "−", with: "-") }`

---
### 💡 Step 2에서 보완한 부분 및 새롭게 안 내용
---
#### 1. SOLID SRP
기존에는 SRP, 즉 단일 책임 원칙을 준수하기 위해선 하나의 타입에 하나의 기능만 들어가야 하는 것이 아닌가 생각했습니다. 하지만 프로젝트를 진행하고 리뷰어인 @GREENOVER의 조언을 듣고 반드시 하나의 기능만 들어가야 하는 것은 아니다는 것을 알 수 있었습니다. 

`CalculateItemQueue`에서도 `appendItem`, `removeItem`, `removeAllItems` 메서드 3개로 구성되어 있습니다. 하지만 세 가지 메서드 모두 Item을 관리하는 역할을 수행하고 있습니다. `CalculateItemQueue`은 Queue를 관리하는 타입인 것이고 3개의 메서드를 통해 하나의 책임을 맡고 있는 것입니다!! 

물론 여기서 DB에서 Item을 가지고 오는 메서드가 있다면 단일 책임 원칙에 위배되겠지만, 현재 `CalculateItemQueue`에서는 단일 책임 원칙이 준수되고 있다고 판단했습니다. 

#### 2. 왜 빈 문자열은 Character로 변환할 수 없는 것일까?
프로젝트를 진행하며 빈 문자열은 Character로 변환할 수 없다는 오류에 마주쳤습니다. 
`Can't form a Character from an empty String`

처음에는 이유를 알지 못했습니다:cry: 
하지만 Character에 대한 공식문서를 살펴보니 답을 찾을 수 있었습니다. 
```swift=
The Character type represents a character made up of one or more Unicode scalar values, grouped by a Unicode boundary algorithm
```

즉, Character는 하나 이상의 유니코드 값으로 구성되어 있다는 것입니다. 
빈 문자열의 경우 하나 미만의 값을 가지고 있으니 당연히 변환을 할 수 없는 것이었습니다. 

#### 3. 불필요한 줄바꿈 제거 (코딩 컨벤션 준수)
미처 확인하지 못하고 불필요하게 줄바꿈을 남겨 놓았습니다.
특히 코드 마지막 부분에 남겨 놓은 불필요한 줄바꿈들이 있었습니다.
(이런 부분까지 꼭 확인하자!!:pray:)

-> 추가적으로 SwiftLint나 Swift-format에 대해서도 공부를 해보도록 하자 💪

#### 4. App Delegate와 Scene Delegate
사실 이전 프로젝트에서 AppDelegate와 SceneDelegate가 controller에 위치해있어서 별 생각없이 Controller 그룹에 넣었습니다.. 😥

하지만 이에 대해 찾아보니 AppDelegate는 iOS13 이후로 데이터 구조를 초기화하고, 알림에 대응하며, 앱 자체를 타겟하는 이벤트에 대응한다고 이해했습니다.
SceneDelegate는 scene에서 일어나는 lifecycle event에 대해 다루고 있구요! 즉 화면에 뭘 보여줘야 할지 관리하는 역할이라 이해했습니다.

아직 AppDelegate와 SceneDelegate를 직접 사용한 적이 한 번도 없어 정확하진 않지만 아예 따로 분리하는 것이 좋을 것 같다고 판단했고, 따로 파일 외부로 분리해놓았습니다.

#### 5. `split`와 `components`
`split`은 `seperator`가 `Character`이고, 반환타입은 [SubString]이었습니다! 또한 Swift 표준 라이브러리에 포함되어 있어 Foundation을 import하지 않아도 사용할 수 있었습니다.
`components`의 경우 매개 변수로 `String`이 들어오고, 반환타입은 [String]이었습니다! components의 경우 Foundation을 import해야 사용할 수 있다고 알고 있습니다.

일단 여기서 `components`를 사용했던 이유는 반환값이 `String`이었기 때문입니다! 물론 `split`의 결과값을 `map`을 사용해 변환할 수도 있었지만 `Character` 타입인 target을 `String`으로 바꾸는 방식이 더 간단하다고 판단해 `components`를 사용했습니다!

다만 조금 더 찾아보니 `split`은 빈 시퀀스를 생략하기 때문에 `components`에 비해 더 빠르게 작동하고, `Components`는 `NSString`에 속해있어 `NSString`과 브릿징하는 작업을 내부에서 해줄 필요가 있었습니다. 

즉, `split`이 `components` 보다 성능상으로 우위가 있다고 판단했고 `split`을 사용하는 방식으로 수정했습니다. 

#### 6. Force Unwrapping을 최소화했습니다. 
기존에는 테스트 파일에서 타입을 불러올 때 반드시 타입이 존재한다고 판단해서 Force Unwrapping을 사용했습니다. 하지만 Force Unwrapping은 앱 크래쉬의 주요 원인이 되기 때문에, 지금부터 최대한 Force Unwrapping을 사용하지 않도록 Force Unwrapping을 사용한 부분을 옵셔널로 처리할 수 있도록 했습니다. 

<br/>


## 1️⃣ Step 3
---
### 🤔 Step 3에서 고민했던 부분 
___
#### 1. 중복되는 코드를 최대한 줄일 수 있는 방법에 대해 고민했습니다. 
처음에는 각 숫자에 해당하는 버튼을 전부 만들어줬습니다. 하지만 이렇게 하니 반복되는 코드가 정말 많았고 코드도 불필요하게 길어졌습니다. 그래서 버튼마다 어떤 값이 있는지 확인할 수 있는 방법이 없을까 고민하다가 UIButton의 title을 가져올 수 있는 `.currentTitle`을 찾을 수 있었습니다. 이를 통해 버튼을 눌렀을 때 각각의 Action을 만들지 않고 하나의 함수로 처리할 수 있었습니다. 

#### 2. `.`이 두 번 이상 찍히지 않도록 하는 방법에 대해 고민했습니다. 
숫자에는 소수점이 두 번 이상 들어갈 수 없으므로 이에 대한 방법을 고민했습니다. 이를 위해 `contains` 메서드를 활용해 `.`이 있는지 확인하고 있으면 그대로 함수를 return하도록 구현했고 없다면 `.`을 추가할 수 있도록 구현했습니다. 

#### 3. 연산자를 연속으로 2번 이상 누르게 된다면 마지막 연산자만 올라가도록 하는 방법에 대해 고민했습니다. 
계산의 전체 로그가 등록되는 textInput이라는 변수에서 마지막 글자를 확인하면 된다고 생각했습니다. 

그래서 `last`를 활용하려 했으나 `last`의 값이 옵셔널로 반환되어 `guard let`을 활용해 옵셔널 바인딩을 해준 후 character의 메서드 중 하나인 `isNumber`를 통해 숫자로 변환할 수 있는 값인지 확인하는 방법을 선택했습니다. 

여기서 if문이 아닌 guard문을 사용한다면 else를 사용하지 않아도 괜찮았지만 숫자가 아닌지 판단하는 메서드를 찾지 못했고, `isNumber == false`로 할 경우 코드의 가독성이 떨어진다고 판단하여 이와 같이 구현했습니다. 

```swift=
guard let lastWord = textInput.last else {
    return
}
if lastWord.isNumber {
} else {
    textInput.removeLast()
}
```

#### 4. 플러스 마이너스 버튼의 기능 구현에 대해 고민했습니다. 
`-`가 있으면 빼주고 없으면 더해주는 로직을 생각했습니다. 
`hasPrefix`를 활용해 `-`가 있는지 확인해주고 있다면 첫 글자를 삭제해주고 없다면 첫글자에 `-`를 추가해주는 방식으로 구현했습니다. 

```swift=
@IBAction func touchUpPlusMinusButton(_ sender: UIButton) {
    if operandText.hasPrefix("−") {
        operandText.removeFirst()
    } else {
        operandText = "−" + operandText
    }
        
    operandLabel?.text = operandText
}
```

#### 5. AC 버튼을 눌렀을 때 계산 로그가 사라지도록 하는 방법에 대해 고민했습니다. 
`countingHistoryStackView`에서 바로 `removeFromSuperView`를 하니 로그는 사라졌지만 아예 StackView가 사라져서 더 이상 입력을 해도 로그가 쌓이지 않는 문제가 있었습니다. 
또한 `removeArrangedSubview`를 사용하게 되면 추가되는 `arrangedSubview`의 이름을 알지 못해 이 메서드 또한 사용할 수 없었습니다. 

그래서 `arrangedSubviews`를 따로 뽑아냈습니다. 또한 `UIView`의 배열이기 때문에 `forEach` 문을 활용해 배열의 요소에 접근해서 `removeFromSuperView`를 사용하도록 구현했습니다. 

#### 6. 자동으로 가장 최근에 작성한 로그가 보일 수 있도록 스크롤되는 방법에 대해 고민했습니다. 
⚠️ 이 부분은 구글링을 통해 구현했습니다. 

공식문서를 통해 `func setContentOffset(CGPoint, animated: Bool)` 메서드를 활용하면 된다는 것은 파악했으나 CGPoint의 값을 어떻게 넣어줘야 하는지에 대해 찾을 수 없었습니다. 

공식 문서 설명에도 `A structure that contains a point in a two-dimensional coordinate system.`로 이차원의 위치를 의미한다는 것 밖에 찾을 수 없었습니다. 

그래서 이 부분은 구글링을 통해 다음과 같이 구현했습니다. 

```swift=
private func scrollToBottom() {
    countingHistoryScrollView.layoutIfNeeded()
    let bottomOffset = CGPoint(x: 0, y: countingHistoryScrollView.contentSize.height - countingHistoryScrollView.bounds.height + countingHistoryScrollView.contentInset.bottom)
    countingHistoryScrollView?.setContentOffset(bottomOffset, animated: false)
    }
```

이 부분은 아직 정확하게 이해를 하지 못해 추가적으로 공부를 할 예정입니다. 

---
### 💡 Step 3에서 보완한 부분 및 새롭게 안 내용
---
#### 1. 함수의 호출 순서를 기준으로 메서드 배치 순서를 수정했습니다. 
다소 메서드의 배치 순서가 뒤죽박죽되어 있는 부분이 있어 가독성과 로직 흐름을 잘 보여주기 위해 메서드 순서를 수정했습니다. 

#### 2. 연산자를 바꿀 때 의미없이 로그가 계속 찍히는 오류를 수정했습니다. 
`addScrollViewLabel()` 함수를 `textInput`의 마지막 글자가 숫자로 변환이 될 경우만 호출할 수 있도록 하여 해결했습니다.

#### 3. Label의 text를 수정하는 부분을 따로 함수로 빼주어 가독성을 고려했습니다. 
기존에 아래처럼 label의 text를 수정하고 로그에 쌓아주는 부분이 가독성이 떨어진다고 판단했습니다. 
``` swift
operatorText = sender.currentTitle ?? "0"
textInput += operatorText
operatorLabel?.text = operatorText
```

따라서 아래처럼 함수를 따로 만들어 가독성을 올릴 수 있도록 수정했습니다. 
``` swift
private func changeLabelText(into text: inout String, at sender: UIButton) {
    text = sender.currentTitle ?? "0"
    textInput += text
    operatorLabel?.text = text
}
```
