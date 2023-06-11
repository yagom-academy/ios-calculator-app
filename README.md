# Calcalutor

## 📖 목차

1. [소개](#1.)
2. [타임라인](#2.)
3. [다이어그램](#3.)
4. [실행 화면](#4.)
5. [트러블 슈팅](#5.)
6. [참고 링크](#6.)


<br>

<a id="1."></a>

## 1. 📢 소개

    사용자에게 숫자와 연산자를 입력받으면 큐에 저장한다.
    = 버튼을 누르면 큐에서 요소들을 꺼내면서 계산한 결과를 보여준다.
    사용자가 숫자를 편하게 읽을 수 있도록 numberFormatter를 사용하였고
    이전 계산 결과들을 볼 수 있도록 스택에  기록하는 기능이 있다.

<br>

<a id=“2.”></a>

## 2. ⏱️ 타임라인

### ▪️ 2023.05.31
*  Queue자료구조 구현
### ▪️ 2023.06.01
* `Formula` , `ExpressionParser`, `Operator` 구현
* 각 객체 테스트 코드 작성
* 에러 정의
* 최적화와 가독성을 위한 리팩토링
### ▪️ 2023.06.02
* 음수 판별 로직 및 수식 검증 절차 추가
* 배열과 더블스택의 퍼포먼스 테스트 
* 배열에서 더블스택으로 자료구조 변경
### ▪️ 2023.06.07
* 빼기 연산자와 음수를 구별하기 위한 `rawValue` 교체
* UI 연결 및 커스텀 `formatter` 구현 
### ▪️ 2023.06.08
* 계산기록을 위한 `StackView`구현
* `VC`에서 비지니스 로직 분리를 위해 `CalculatorManager` 구현
* 불필요한 에러 제거 및 불필요한 테스트 제거
* 소수점 이슈, = 버튼 중복 클릭 이슈 등 해결
### ▪️ 2023.06.10
* 전반적인 네이밍 통일 및 extension을 통한 코드 재사용 
* 알고리즘 단순화 및 네임스페이스 지정
<br>

<a id=“3.”></a>

## 3. 📊 다이어그램

![Calculator](https://github.com/agilestarskim/ios-calculator-app/assets/79740398/92149839-576f-419c-bffd-5d3b3214b0f2)

<br>

<a id=“4.”></a>
## 4. 📲 실행 화면
|일반연산|음수연산|소수연산|
|----|----|----|
|![일반연산](https://github.com/agilestarskim/ios-calculator-app/assets/79740398/4ab6bcab-df6b-42b2-abac-b129a12807c6)|![음수연산](https://github.com/agilestarskim/ios-calculator-app/assets/79740398/5812a32d-a6df-4acc-9f99-c1265c391595)|![소수연산](https://github.com/agilestarskim/ios-calculator-app/assets/79740398/5e2d2ae0-bca5-475b-bbac-d0ae8e23be6b)|






<br>

<a id=“5.”></a>
## 5. 🛎️ 트러블 슈팅

### 🔥 음수와 빼기 연산자 구분

#### 🤯문제상황
ExpressionParser에서 연산자를 기준으로 문자열을 분리하는 로직이 있습니다.
하지만 음수 기호도 빼기 연산자와 똑같아 Parser에서 연산자로 인식하는 문제가 있었습니다. 

#### ✨해결방법
연산자로 나눈 직후 다음 문자가 “-“ 일 경우 음수로 인식하는 로직을 추가하여 해결했습니다.
```swift    
// ...
if char.isOperator &&  currentSegment.filter({ !$0.isOperator}).count > 0 {
        //...
    }
// ...
```
currentSegment에 연산자가 아닌 것이 하나라도 있으면 현재 char는 연산자이고, 연산자가 아닌 것이 하나도 없다면 char는 음수 기호라고 판단할 수 있습니다.

이후 육안으로는 같은 기호이지만 다른 값을 가지고 있는 “﹣”과 “−”을 이용해 음수와 빼기 연산자를 구분하였습니다.

### 🔥 잘못된 수식 검증

#### 🤯문제상황
가령 “5+a”, “10.0.1+12” 같은 유효하지 않는 수식이 들어오는 것을 어떻게 처리할 것인가 고민하였습니다.  

#### ✨해결방법
```swift
let operands = items.compactMap { Double($0) }
let operators = items
    .filter { validOperators.contains($0) && !$0.isEmpty }
    .compactMap { Operator(rawValue: Character($0)) }
        
guard items.count == operands.count + operators.count else {
    throw CalculationError.invalidInput
}
        
guard operands.count == operators.count + 1 else {
    throw CalculationError.invalidInput
}
```
Double로 형변환하는 과정에서 숫자로 바꿀 수 없는 것들은 자동으로 nil을 리턴하게 되고,  nil인 것들은 자동으로 필터링해주는 compactMap을 사용하여 피연산자들을 저장했습니다.
그 후 원본 배열과 필터링 된 이후 배열의 갯수를 비교해 유효한 값이 있었는지 없었는지 판별하는 로직을 만들어 에러를 방출하였습니다.

### 🔥 다양한 상황에서의 포멧

#### 🤯문제상황
사용자에게 숫자를 입력받을 때마다 NumberFormatter를 거쳐 출력했습니다.
그러다보니 5.003이라는 값을 입력해야한다고 가정했을 때
0을 입력하는 부분에서 소수점이 자동으로 필터링 되어 보여지지 않았습니다.

#### ✨해결방법
InputFormatter라는 커스텀 Formatter를 만들었습니다.
정수와 소수부분을 .을 기준으로 나누고 정수부분은 기존의 numberFormatter를 사용하고
소수부분은 그대로 사용하지 않은 채 마지막에 정수부분과 소수부분을 합쳐 리턴했습니다.

또한 2+3의 결과가 5.0의 Double형태로 리턴되는 이유로 다시 결과가 연산 큐에 들어가는 과정에서 .0이 붙는 이슈가 있었습니다. 따라서 결과를 연산 큐에 넣는 과정에서 다시 한번 .0을 지워주는 Formatter를 거쳐야 했으므로 ExpressionFormatter를 만들었습니다. 기존의 numberFormatter는 결과를 보여주는 format이기 때문에 ResultFormatter라는 이름으로 분리하였습니다.

### 🔥 변수가 많아질 수록 복잡도 증가 문제
#### 🤯문제상황
처음 뷰컨트롤러를 만들었을 때 currentOperand와 currentOperator, totalExpression등 다양한 변수들이 존재했습니다. 입력 검증을 쉽게 하기 위해서 만든 변수들이었는데 시간이 지나고 로직들이 많아지면서 복잡도가 점점 증가했습니다. 복잡도가 증가하면서 각 변수들의 동기화를 계속해주어야했고 동기화가 안되는 순간 많은 버그들이 생겼습니다.
#### ✨해결방법
변수들을 최대한 줄이고 하나의 변수로만 통제가능할까 고민을 해보았습니다.
결론적으로 문자열을 저장하는 변수하나만으로 입력과 결과를 받을 수 있을 것 같다는 생각이 들었습니다.
변수이름을 expression이라고 명명하고 expression을 사용자의 입력에 따라 자르고 붙이고 삭제하는 형식으로 로직을 구현하였습니다.

1️⃣ **연산자가 들어올 경우**  
마지막 문자가 연산자인 경우 마지막 문자를 지우고 입력된 연산자로 바꿔치기 한다.
마지막 문자가 피연산자인 경우 입력된 연산자를 붙인다.

2️⃣ **피연산자가 들어올 경우**  
해당 피연산자를 일단 expression에 붙이고 마지막 연산자를 찾아 그 뒤부터 슬라이싱하여 현재 입력되고 있는 피연산자를 리턴한다. 

3️⃣ **부호를 바꾸는 경우**  
이전 스탭에서 슬라이싱된 현재 피연산자의 앞글자가 -이면 -을 지우고 아니면 -를 붙여 새로운 문자열을 만든 뒤, expression에서 현재 입력되고 있는 피연산자를 삭제하고 방금 만든 문자열을 붙인다.
```swift
func toggleSign() -> String {
    let isNegative = self.incomingRecentOperand.first == Sign.minus
    let isZero = self.incomingRecentOperand.isEmpty
    
    let signToggledOperand =  isNegative || isZero
    ? String(self.incomingRecentOperand.dropFirst())
    : String(Sign.minus) + self.incomingRecentOperand
    
    self.clearRecentOperand()
    self.expression.append(signToggledOperand)
    return InputFormatter.format(from: self.incomingRecentOperand)
}
```
이 외에도 ClearEntry를 할 때, 소수점을 붙일 때 결과를 리턴할 때 등 문자열을 슬라이싱하고 삭제하고 붙이는 과정을 통해 문자열 하나로 모든 입력을 관리할 수 있게 만들었습니다.

처음엔 문자열을 조작하면서 메소드가 정말 방대했지만 내용들이 반복된다는 것을 알았고 자주 사용되는 기능들을 함수로 분리하니 코드가 점점 가벼워졌습니다. 

다음은 자주 사용되는 기능을 분리한 메소드 입니다.
```swift
private func getRecentOperand() -> String {
    if let recentOperatorIndex = self.getRecentOperatorIndex() {
        let startIndex = self.expression.index(after: recentOperatorIndex)
        let substring = self.expression[startIndex...]
        let result = String(substring)
        return result
    }
    return self.expression
}

private func getRecentOperatorIndex() -> String.Index? {
    return self.expression.lastIndex { $0.isOperator }
}

private func getRecentOperator() -> String {
    if let recentOperator = self.expression.last(where: { $0.isOperator }) {
        return String(recentOperator)
    } else {
        return Symbol.empty
    }
}
```


<a id=“6.”></a> 
## 6. 🔗 참고 링크
* [Docs-NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
* [Blog-StackView의 subviews 지우기](https://bibi6666667.tistory.com/362)
* [Blog-Queue 와 더블스택](https://apple-apeach.tistory.com/8)
