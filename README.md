# Calculator - 계산기 :fire:
## 프로젝트 개요
* 계산기UI에서 데이터를 입력받아 연산처리하는 프로젝트
* 프로젝트 인원: [Goat]()
* 프로젝트 기간: 2023.01.24 - 23.02.03

## 목차

- [폴더 구조](#폴더-구조)
- [타임라인](#타임라인)
- [시각화된 프로젝트 구조](#시각화된-프로젝트-구조)
- [트러블 슈팅](#트러블-슈팅)
- [키워드](#프로젝트를-통해-학습한-키워드)
- [개선할 부분](#개선할-부분)



## 폴더 구조

```
├── Controller
|   └── ViewController
├── CalculatorTests
|   ├── CalculatorQueueTests
|   ├── SplitTests
|   └── Operator
|   └── FormulaTests
|   └── ExpressionParserTests
├── Model
|   ├── CalculateItem
|   ├── Enumeration
|   └── Operator
|   └── CalculateQueueItem
|   └── Formula
|   └── ExpressionParser
├── Extension
|   └──StringExtension
|   └──OperatorExtension
|   └──DoubleExtension
└── View
    ├── Main
    └── Assets
    └── LaunchScreen

```

----
    
## 타임라인
> 시간 순으로 프로젝트의 주요 진행 척도를 표시
> - 23.01.23(월): --설연휴--
> - 23.01.24(화): 제시된 UML구조파악 및 queue자료구조 공부
> - 23.01.25(수): STEP1 시작, queue구현, PR요청
> - 23.01.26(목): STEP1 PR리뷰사항 반영, merge
> - 23.01.27(금): STEP2 시작

> - 23.01.30(월): STEP2 진행
> - 23.01.31(화): STEP2 PR요청 및 리뷰사항반형, merge
> - 23.02.01(수): STEP3 진행
> - 23.02.02(목): STEP3 진행
> - 23.02.03(금): STEP3 진행

<br/>

## 시각화된 프로젝트 구조

<img src="https://i.imgur.com/wmSlBt9.png" width="100%" height="80%"/>




<br/>


### 기능 설명
<img src="https://i.imgur.com/4pdqGIm.png" width="200" height="420"/>

* 계산기의 숫자(Operand)와 연산자(Operator)버튼을 눌러 계산을 실행합니다
* 연산값은 (숫자 + 연산자) 형식으로 상단 스택뷰에 스크롤뷰로 쌓이게 됩니다
* = 버튼은 입력된 값들을 모두 연산처리하며, = 버튼을 누르기전에는 연산을 실행하지 않습니다
    * AC 버튼은 모든 값들을 clear
    * CE 버튼은 현재 입력하는 숫자 or 연산결과(숫자)만 삭제합니다
    * +/- 버튼은 플러스,마이너스 부호만 변경합니다

<br/>

## 트러블 슈팅

#### 1. DoubleStack
* queue 구조에서 dequeue구현시 배열에서의 removeFirst()가 O(N)의 시간복잡도를 가지기 때문에 문제가 생긴다는 점을 발견했습니다
* 시간복잡도를 해결하는방법으로 여러 방법이 있었는데, 저는 stack을 두개 운영하면서 옮겨사용하는 방법으로 채택했습니다

```swift
var enqueueStack: [T] = []
var dequeueStack: [T] = []

mutating func dequeueItem() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
            return dequeueStack.popLast()
    }
```
#### 2. extensin String - split(with: Character) 매서드 구현에서의 문제
* 제시된 UML을 해석해보면 split은 `Characte`타입인 `Operator`를 기준으로 `split()`하는 매서드이며, 
`componentsByOperators(from target: String) -> [String]`안에 들어와 String배열을 내보내는 구조인거같은데, 이 부분을 구현하는데 에러가 많았습니다.
    1. (문제) split은 기준을 두고 나눠진값을 배열로 반환한다 -> split한 결과를 빈배열에 담아서 append하려니 이중배열이 되는 문제가 생겼습니다.(
        * (해결) `curruentNumber[] += $0.split(someChracter: number.rawValue)` += 로 빈배열에 결과를 담는식으로 해결했습니다
        * (해결2) split을 담아내는 이중배열을 flatMap고차함수로 해결했습니다
```swift
 var resultNumber: [String] = [target]
        
        Operator.allCases.forEach { oper in
            resultNumber = resultNumber.map { $0.split(someChracter: oper.rawValue) }.flatMap {$0}
        }
```

<br/>

#### 3. split()으로 피연산자만 뽑아내는데 성공했지만, 음수/양수 변경하는 부분에서 고민
```swift
"1 + 3 x (-11) + 34 * 5" // split 적용했을 때
-> ["1", "3", "11", "34", "5"]
```
* (문제) 위와같은 경우의 `String`을 받아와 `split()`했을때 음수에 대한 `Operator` 역시 `split()`에서 걸러지므로 사라지는 경우가 생길 수 있다고 생각했습니다.
    * split()부분에서 시행착오가 많았어서 일단 넘어갔는데, 음수 양수 변환문제를 어떻게 해결할지 추후에 다시 생각해봐야할것 같습니다.
        * (해결) -오퍼레이터를 처리할때 화면에는 실제 음수(-)와 다르지만 유사한 형태의 캐릭터 이모티콘을 채택함으로써 Operator.Enum에 걸리지않도록 설정해 해결했습니다.

<br/>

#### 4. getInputtedNumber()

 `getInputtedNumber()` 라는 매서드를 통해 연결된 숫자 스트링을 출력해주고
 `buttonTapped`가 일어날때마다 매서드를 호출해 `currentNumnberOnField.text` 현재 숫자 표시 레이블에 넣어주는 식을 구현했었습니다. 아래와 같은 식으로 매서드 구현시 강제추출이 아니면 에러가 나서 
    * (해결)`전역변수를 사용하는 방법`으로 해결했습니다
  ```swift
currentNumberOnField.text! += getInputtedNumber(sender) //Error: need force Unrapping
 ```
 
 <br/>
 
 
 #### 5. scroll To Bottom 설정

```swift
  func setUpScrollView(){
            let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
            if(bottomOffset.y > 0) {
                self.scrollView.setContentOffset(bottomOffset, animated: true)
            }
        }
```
 * (문제) 스크롤뷰안에 스택뷰 구현시, 스택뷰가 지속적으로 쌓이지않고 한계를 보이는 현상이 있었습니다
* 이유를 알고보니 스크롤 아래쪽으로 스택뷰는 화면에 보이지 않을 뿐 계속 쌓이고있었고 ,
    * (해결) `setContentOffset(bottomOffset)` 키워드를 통해 스크롤 시작포인트가 bottom으로 향할 수 있게 설정함으로써 데이터가 쌓여올라가는 구조를 보이게끔 해결했습니다.

<br/>

#### 6. addStackView 스택뷰 추가시 오퍼레이터 분기처리

<img src="https://i.imgur.com/zqA5DmB.png" width="200" height="420"/>

* (문제) 화면에는 위와같이 [ 숫자 + (연산자+숫자) + (연산자+숫자) ] = [결과] 의 식으로 스택뷰에 숫자가 먼저 들어가야합니다.
* 스택뷰를 추가해주는 과정에서 스택뷰에 (연산자 + 숫자)가 아닌 숫자만 들어갈 수 있게 분기처리를 어떻게 할지 고민하다가. 전역변수 calcuateComponents 라는 전역변수를 하나 더 설정함으로써 해결할 수 있었습니다.
```swift=
var inputNumbers = "" 
var calcuateComponents = ""

if calcuateComponents == "" {
            calcuateComponents += inputNumbers
            addNewStackView(number: inputNumbers, oper: currentOper)
        } else {
            calcuateComponents += currentOper + inputNumbers
            addNewStackView(number: inputNumbers, oper: currentOper)
```

<br/>

### 프로젝트를 통해 학습한 키워드
- `class`, `struct`
- `forEach`, `flatMap`, `map`, `closure`
- `doubleStack`
- `split`, `split(whereSeparator: Bool)`, `split(maxSplits: Int)`,`components`
- `scrollView`, `stackView`, `addArrangedSubView`, `SetContentOffset(bottomOffset)`

### 개선할 부분

* 아직 STEP3를 완료하지못해서, `에러처리, AC, CE, +/-, = 버튼에 대한 구현이 더 필요합니다. 이 부분은 추가해서 수정해놓을 예정입니다`

