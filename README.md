# Readme
![](https://i.imgur.com/kJQrysx.png)

# **1. 제목: Calculator🧮**

# **2. 소개💬**
사용자가 화면의 숫자패트와 기호를 통해 연산을 입력하면, 결과를 화면을 통해 전달한다.

# **3. 팀원👩‍💻👩‍💻**
|Som|
|:-----:|
|![](https://i.imgur.com/1AzO7gz.png)|

# **4. 타임라인⏳**
## 2022/09/19
- `protocol CalculatorItem` 타입 생성 
- `struct CalculatorItemQueue` 타입 생성
- `enQueue() & deQueue() & clear()` 메서드 추가
- `enum QueueError` 타입 생성
- `CalculatorItemQueueTests unit test` 생성
- `deQueue` 메서드가 실행되었을 때 `outputStack`이 `nil`일 때 `inputStack`이 배열요소의 순서를 뒤집어 `outputStack`에 넣는지에 대한 테스트 케이스 추가
- `deQueue` 메서드가 실행되었을 때 `inputStack`의 순서를 뒤집어 `outputStack`에 넣고 `inputStack`의 요소를 모두 없애는 지에 대한 테스트 케이스 추가
- `deQueue` 메서드가 호출되었을 때 `outputStack`의 마지막 요소를 반환하는 지에 대한 테스트 케이스 추가
- `outputStack`이 `nil`일 때 `enQueue` 메서드를 호출하고 deQueue 메서드를 호출하면 값을 잘 반환하는 지에 대한 테스트 케이스 추가

## 2022/09/23
- `QueueError` 소스파일 삭제
- `deQueue` 메서드 수정
- `enum Operator` 타입 선언
- 사칙연산(`add()`, `subtract()`, `divide()`, `multiply()`), `calculate()` 메서드 추가 
- `struct Formula` 타입 선언
- `enum FormulaError` 타입 선언
- `result` 메서드 추가
- `enum ExpressionParser` 타입 선언
- `componentsByOperators()`, `parse()` 메서드 추가
- `extension String, Double` 추가
- `FormulaTests unit test` 생성
- 값이 없을 때 `result()` 메서드를 실행하면 오류가 나는지에 대한 테스트 케이스 추가

## 2022/09/27
- 0으로 나눌 경우의 예외 처리 구현
- 폴더링
- componentsByOperators 메서드 수정

## 2022/09/29
- 스토리보드의 버튼, 레이블, 뷰를 ViewController에 연결
- tappedOperandButton 메서드 추가
- tappedOperatorButton 메서드 추가
- signOfOperator 메서드 추가
- addNewLableToStackView 메서드 추가
- addNewLableToStackView 메서드 수정
- addLabelAndSign 메서드 추가
- resetVauleToZero 메서드 추가
- resetStackView 메서드 추가
- initializeExpression 메서드 추가
- tappedOperatorButton 메서드 수정
- tappedOperatorButton 메서드 수정
- resetExpressionString 메서드 수정
- assignTotalString 메서드 추가
- tappedOperatorButton 메서드 수정
- tappedEqualButton 메서드 추가

## 2022/09/30
- executeExpression 메서드 추가
- OperatorError 중첩타입으로 추가
- calculate 메서드 수정
- ValueError 소스 파일 생성 & 기존의 Error 타입을 ValueError로 통합
- executeExpression 메서드 수정
- displaySignAndLabel 메서드 추가
- executeExpression 메서드 수정
- resetTotalString 메서드 추가
- resetSignLabel 메서드 추가
- tappedACButton 메서드 추가
- addNewLableToStackView 메서드 수정
- resetStackView 메서드 호출 부분 수정
- split(with:) 함수 수정
- tappedCEButton 메서드 추가
- tappedPlusMinusButton 메서드 추가
- viewDidLoad에 reset 메서드 호출
- 연산이 안 되는 오류 해결
- NumberFormatter 추가 구현
- NumberFormatter 적용
- componentsByOperators 메서드 수정
- CalculatorNameSpace 소스 파일 생성 & enum 선언
- CalculatorNameSpace 적용


# **5. 시각화된 프로젝트 구조📊**
![](https://i.imgur.com/r5FgreR.jpg)



# **6. 실행 화면📱**
|정수 연산|소수 연산|
|:-----:|:-----:|
|![](https://i.imgur.com/nzafuWq.gif)|![](https://i.imgur.com/LUmWxqt.gif)|




# **7. 트러블 슈팅🧐**
- Xcode 오류
→ Build Setting에서 macOS를 iOS로 설정을 변경하면 된다. 처음 보는 오류에 당황했는데, 찬찬히 읽어보면 해결할 수 있는 문제였다.

![](https://i.imgur.com/Nyugzqe.png)

- UML 다이어그램을 활용한 프로그래밍
주어진 UML을 참고하여 프로그래밍한 것이 처음이라 UML이 100% 이해되지 않아 많이 혼란스러웠다. 
→ 전체적인 흐름을 파악하는 것을 포기하고 2개의 타입 관계에 집중하여 코드를 구현하기 시작하면서, 흐름이 어느 정도 파악된 거 같다. 코드를 구현하면서 UML이 제시하는 설계가 이해가 되었다. 

- Queue...?!
평소에 알고리즘에 자신이 없었던 터라 구현할 수 있을까? 에 대한 두려움이 생겼다.
→ 구현에만 매달리지 않고, 이해에 매달렸다. Swift Queue 관련된 코드를 다 읽어보고, "어느 코드가 더 효율적이고, 어떻게 코드가 작동할까?"에 하루를 투자했더니 감이 잡히기 시작했다. 더불어 시간복잡도에 대한 공부 또한 할 수 있었다.

- `inputStack이` `nil`일 경우, `deQueue` 메서드가 실행될 때
```swift
mutating func deQueue() -> T? {
    if inputStack.isEmpty {
        return nil
    }
        
    if outputStack.isEmpty {
        outputStack = inputStack.reversed()
        inputStack.removeAll()
    }
    return outputStack.removeLast()
}
```
하지만 이렇게 구현하니 테스트 코드를 돌릴 때, 아래와 같은 오류가 일어났다.

![](https://i.imgur.com/2nvZDqc.png)

→ `inputStack`이 빈 배열로 `deQueue` 메서드로 실행되기 때문에 `nil` 상태가 되어, `nil`이 리턴되는 `popLast()`로 다시 수정했다.





# **8. 참고 링크🙇‍♀️**
[Queue](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Queue) <br>
[시간복잡도](https://hanamon.kr/%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-time-complexity-%EC%8B%9C%EA%B0%84-%EB%B3%B5%EC%9E%A1%EB%8F%84/) <br>
[Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html) <br>
[NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter) 
