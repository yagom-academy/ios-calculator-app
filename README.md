# ➕➖ 계산기 ➗✖️


## 접니다 👀
 |<center> [릴라](https://github.com/juun97)</center> |
| --- | 
|<img width="200" alt="image" src=https://cdn.discordapp.com/attachments/1054218081787973662/1058207490296262665/KakaoTalk_Image_2022-12-23-11-04-10.png> | 


## 소개 🔎
> 입력받은 순서대로 사칙연산을 진행하는 앱 만들기
>
> 기간 : 2023.01.24 ~ 2023.02.03
>
> 리뷰어 : [웡빙](https://github.com/wongbingg) 🧑🏻‍💻





## 타임라인 ⏰

| STEP  | 날짜             | 타임라인                                                                                                                                                                     |
| --------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|STEP1| **2023.01.24** |- CalculatorItemQueue타입 정의 </br>- CalculateItem 프로토콜 정의 
|STEP1| **2023.01.25** |- CalculatorItemQueue TDD 개발 진행 </br>- CalculatorItemQueue 유닛 테스트 진행 </br> -  CalculatorItemQueue 메서드 구현 
|STEP1| **2023.01.26** |- 피드백 사항 리팩토링 
|STEP2| **2023.01.30** |- UML 상의 코드 틀 구현 </br> - Type Extension 진행 </br>- ExpressionParser 구현 및 테스트 진행
|STEP2| **2023.01.31** |- Operator 타입 구현 및 테스트 진행 </br> - Operator 리팩토링 
|STEP2| **2023.02.01** |- Formula 타입 구현 및 테스트 진행 </br> - Queue타입 내 deque 로직 수정 </br>- 전체적인 컨벤션 점검
|STEP3| **2023.02.01** |- Operands 버튼 클릭 메서드 구현 </br> - Operands 제약사항 구현 
|STEP3| **2023.02.02** |- Operator 버튼 클릭 메서드 구현 </br> - 입력 사항 StackView에 업데이트 메서드 구현 </br>- Operator 제약사항 점검
|STEP3| **2023.02.03** |- 부호 변경메서드 구현 </br> - NumberFormatter 적용 </br>- 초기화 메서드 구현


## 파일구조

```
├── Application
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Controller
│   └── ViewController.swift
├── Error
│   └── CalculateError.swift
├── Info.plist
├── Model
│   ├── CalculateItem.swift
│   ├── CalculatorItemQueue.swift
│   ├── ExpressionParser.swift
│   ├── Formula.swift
│   ├── Operator.swift
│   └── extension.swift
├── Resource
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   └── Base.lproj
│       ├── LaunchScreen.storyboard
│       └── Main.storyboard
├── Test
│   ├── CalculatorTests
│   │   └── CalculatorTests.swift
│   ├── ExpressionParserTest
│   │   └── ExpressionParserTest.swift
│   ├── ExpressionTest
│   │   └── ExpressionTest.swift
│   ├── FormulaTests
│   │   └── FormulaTests.swift
│   └── OperatorTest
│       └── OperatorTest.swift
└── View


```



    

## 실행화면 🎬
- 오류잡고 바로 올리겠습니다.

## 트러블슈팅 🚀

## 💭 STEP 1

<details>
<summary>STEP 1 </summary>
    
### 1️⃣ dequeue의 로직
- Array에서 제공하는 메서드인 removeFirst를 통해 간단하게 구현을 할 수도 있었습니다. 하지만 removeFirst의 경우 첫 번째 요소를 삭제한 뒤 남은 요소들의 인덱스를 한 칸씩 당겨줘야하는 작업이 필요해 O(n) 의 시간복잡도를 가져 성능면에서 더 개선의 여지가 있을거라 생각했습니다.
- 그렇게 해서 생각한 로직이 firstIndex 변수를 만들어 삭제할때마다 Index를 제어해 firstIndex가 유효한 값이 있는 첫번 째 인덱스를 가르키도록 하는 것 이었습니다.
- dequeue 가 일어날 때 삭제된 요소에 nil을 할당하고 firstIndex를 1증가 시키게 되면 O(1)의 시간복잡도를 가지게 되어 더 개선된 성능을 가지게 됩니다.
```swift
mutating func dequeue() -> T? {
        guard queue.isEmpty != true,
              frontIndex <= count,
              let element = queue[frontIndex] else { return nil }
       
        queue[frontIndex] = nil
        frontIndex += 1

        return element
    }
```
- 물론 이 로직도 개선의 필요가 있습니다. 겉으로 보았을때 queue의 크기는 줄어든것 처럼 보일수도 있으나 실제로는 queue의 크기는 변하지 않고 nil이 할당 되있는 상태입니다. 

### 2️⃣ dequeue가 진행된 queue의 count 구하기
- 실제로 queue의 요소가 삭제된 것이 아닌 nil을 할당하는 것이었기에 array의 count를 사용하게 되면 nil을 포함한 count를 반환한다는 것을 Unit Test 를 통해 알게 되었습니다.
- queue에서 유효한 값이 있는 첫 번째 인덱스는 frontIndex가 보유하고 있었기에 endIndex 에서 frontIndex 를 빼주게 되면 실제 보유하고 있는 요소의 갯수가 나오게 됩니다.
```swift
public var count: Int {
        let count = queue.endIndex - frontIndex
        return count
    }
```
### 3️⃣ dequeue의 요소가 삭제되었는지 확인하는 유닛테스트
- 처음에 테스트를 진행할 때는 dequeue 로 요소가 삭제되면 count가 줄어들거라 생각해 dequeue가 실행 된 뒤 카운트와 기댓값을 비교하는 테스트를 진행했습니다.
- 하지만 count 가 줄어드는것이 요소가 삭제되었는지를 확인하는 테스트가 아닌것 같다는 피드백을 듣고 수정을 진행했습니다.
- Queue 안의 배열 프로퍼티에 접근하여 배열의 첫번 째 요소와 nil 을 비교하는 방식으로 진행하였습니다.

```swift
    func test_dequeue를_실행할때_첫번째요소가_삭제된다() {
        //given
        let firstElement = 1
        let secondElement = 2
        let thirdElement = 3
        //when
        sut?.enqueue(firstElement)
        sut?.enqueue(secondElement)
        sut?.enqueue(thirdElement)

        sut?.dequeue()
        
        let result = sut?.queue.first
        let expectation: Int? = nil
        //then
        XCTAssertEqual(result, expectation)
    }
```
</details>
    
## 💭 STEP 2
    
### 1️⃣ 요소의 갯수만큼 dequeue 를 진행할 때 마지막에 nil 이 반환된 점
- Formula의 Unit Test를 진행하던 중 Queue의 마지막 값을 반환하지 못한 채 반복문이 종료되는 이슈가 있었습니다.
- Formula 파일 내에서 문제를 찾아보려 디버깅을 시도하였으나 원인을 찾지 못해 step over 를 이용해 코드의 흐름을 하나 하나 따라가 보았습니다.
- 그 결과 Formula의 문제가 아닌 Queue 내의 dequeue 로직에 결함이 있음을 발견했습니다.
```swift
    public var count: Int {
    let count = queue.endIndex - frontIndex
    return count
    }


     mutating func dequeue() -> T? {
        guard queue.isEmpty != true,
              frontIndex < count,
              let element = queue[frontIndex] else { return nil }
       
        //...
        return element
    }
```

- frontIndex의 최댓값은 enqueue가 마지막으로 들어온 시점의 요소의 갯수 이지만 count 프로퍼티는 nil을 제외한 순수 남은 요소의 갯수를 반환하기에 count를 가지고 비교하는건 잘못됐다는 것을 알았습니다.
- 그래서 count 를 queue.count 로 수정해 dequeue가 되어 nil 이된 요소까지 포함하는 count로 비교할 수 있게 수정했더니 정상작동이 되었습니다. 



### 2️⃣ input 값을 무엇으로 split을 해야하는가
- input 값을 연산자로 split을 해야하나 띄어쓰기로 split 해야하나 많은 고민을 했습니다. 
- 연산자로 split 하는 경우 음수의 표시를 위한 -도 나눠지기에 subtract의 기호를 다른걸로 교체하지 않는 이상 문제점이 있다고 판단했습니다.
- 이 판단을 바탕으로 띄어쓰기로 split 하는것을 결정했습니다.


### 3️⃣ split 한 값을 각각의 큐에 enqueue 하는 방식
- split을 해 생긴 String 배열은 숫자와 연산자가 하나의 배열에 같이 존재했습니다. 
- 해당 배열을 반복문을 통해 if let Binding 을 통해 Double로 형변환이 가능한 요소는 operands에 enqueue를 진행했고 Operator로 형변환이 가능한 요소는 operators에 enqueue를 진행했습니다.

```swift
 let components = componentsByOperators(from: input)

        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()

        for component in components {
            if let operand = Double(component) {
                operands.enqueue(operand)
            } else if let operatorSign = Operator.returnOperator(input: component) {
                operators.enqueue(operatorSign)
            }
        }
```

### 4️⃣ Queue 모든 요소의 계산과정
- 계산 과정상 숫자의 요소가 연산자의 요소보다 필연적으로 1개가 더 많을 수 밖에 없습니다. 
- 그렇기에 처음 leftValue 를 통해 숫자의 첫 번째 요소를 dequeue를 진행을 한뒤 while binding 을 통해 queue의 요소가 nil 이 아닐때 까지 반복문을 실행 하였습니다.

```swift
guard var leftValue = operands.dequeue() else { return .nan }
        while let rightValue = operands.dequeue() {
            guard let operatorSign = operators.dequeue() else { return .nan }
            leftValue = operatorSign.calculate(lhs: leftValue, rhs: rightValue)
        }

```
    
    
    
## 💭 STEP 3


### 1️⃣ 0이 계속해서 들어왔을 때의 오류처리

<img width="600" alt="image" src=https://i.imgur.com/B8j0As5.png>

- sender 의 currentTitle 로 버튼의 숫자를 받아온 뒤 해당 숫자가 0과 00일 경우에 조건문을 통해 오류처리를 진행 하였습니다.
 
### 2️⃣ 연산자 버튼의 오류처리
- 제일 오랫동안 헤매던 부분이었습니다 😭
- 연산자 버튼을 클릭했을 때 생각해야 했던 경우의 수는 다음과 같았습니다.
    > 1. OperandsLabel 에 아무값이 들어오지 않은 채 버튼이 눌렸을 때
    > 2. 연산자 버튼이 연속으로 눌렸을 때
 
 - 1번의 경우 전역으로 OperandLabel 의 텍스트 값을 가지고 있는 CurrentLabelText 를 통해 값이 존재하지 않는 경우 연산자의 라벨만 입력값으로 교체한 뒤 리턴을 하는 방향으로 진행 했습니다.
```swift
         if currentLabelText.isEmpty && formattedOperands.isEmpty {
             OperatorLabel.text = sender.currentTitle
             return
         }
```

 - 2번의 경우 입력값을 연산자와 피연산자를 순서대로 보관하고 있는 inputList 를 통해 마지막 element 가 Operator 로 형변환이 가능한지를 판단하여 Operator일 경우 OperatorLabel 의 text 만 변경을 해준 뒤 return을 했습니다.

```swift
         if let element = inputList.last {
             guard Operator(rawValue: Character(element)) == nil else {
                 OperatorLabel.text = operatorSign
                 return
             }
         }
```

### 3️⃣ 계산식을 만드는 로직
- 계산식의 경우 operand 와 oprator 를 순서대로 보관하는 `inputList: [String]` 배열을 만들어 관리했습니다.
- 요소를 `append` 하는 시점은 하나의 입력이 끝났다고 판단하는 `operatorButton` 의 클릭 시점으로 잡았습니다.
- 하지만 이런식으로만 `append` 를 진행할경우 `마지막 1개의 operand` 가 화면에만 출력되고 배열에는 들어가지 않음으로 calculate 버튼이 눌렸을 때 화면에 출력되어있는 요소에 대해 append를 진행 하였습니다.
- operator 의 경우에도 문제점이 있었는데 연산자가 `연속으로 클릭` 되었을 때 화면에 출력되있는 operator만 수정한뒤 return  하고 있었기에 inputList에 저장되있는 operator와 화면에 출력되있는 operator가 다를 수도 있는 문제점이 있었습니다.
- 이 부분은 calculate 버튼이 클릭되는 시점에 operand 가 append 되기전 inputList의 마지막 요소를 제거한 뒤 현재 화면에 출력되있는 operand를 다시 append 를 진행하였습니다.

```swift
    @IBAction func calculateButtonDidTap(_ sender: UIButton) {
           guard currentLabelText.isEmpty == false,
                 let operatorSign = OperatorLabel.text  else { return }
           inputList.removeLast()
           inputList.append(operatorSign)
           
           updateScrollView()
           inputList.append(currentLabelText)
           
           let calculate = inputList.reduce("") { current, next in current + " " + next}
           
    //...
       }
```
- 만약 정상적으로 inputList의 append 가 완료 되었다면 고차함수 `reduce` 를 이용해 하나의 String으로 합쳐주어 작업을 진행하였습니다.


### 4️⃣ 계산이 끝난 후 나온값을 연속해서 처리하기 위한 로직
- 하나의 연산의 끝나게 되면 결과값이 `operandsLabel` 에 출력이 됩니다. 하지만 결과값이 출력이 된 상태에서 operands 의 입력이 오게 된다면 결과값에 추가하는게 아닌 `새로운 입력값` 으로 처리를 진행해야 했기에 고민이 필요했습니다.
    - operands가 새로 들어올 때
    > 결과값이 사라지고 새로운 값이 화면에 출력됨
    - 결과값이 출력된 채로 operator가 들어올 때
    > 해당값을 inputList에 append 해야함
- 연산이 끝나게 되면 현재 유저가 어떤 값을 입력하고 있는지 판단하는 currentTextLabel에 공백을 주고 operatorButton 에서 operands의 판단 기준을 OperandsLabel로 잡는 방식으로 해결했습니다.
    
    
### 5️⃣ 정수로 변환가능한 실수의 처리
- 연산결과의 반환 타입이 Double 이었기에 정수인 숫자도 소수점이 붙은채로 나오는 구조였습니다. 
- Double 타입을 Int 타입으로 변환시킬 때는 소숫점에 있던 숫자는 사라지고 정수만이 남은채로 변환 됩니다.
- 이점을 이용해 Double 타입의 결괏값과 Int 타입으로 형변환한 값을 비교하여, 두 숫자가 같을 경우 Int타입 결과값을 화면에 출력하는 식으로 해결했습니다.
```swift
let intResult = Int(result)
                

if result == Double(intResult) {
        OperandsLabel.text = formatNumber(intResult.description)
        isDotClicked = false
    } else {
        OperandsLabel.text = formatNumber(result.description)
        isDotClicked = true
    }
```
    
## 톺아보기🧘🏼

- 처음으로 혼자서 진행하는 프로젝트이다 보니 좋은점도 있었으나 아쉬운점도 많이 있었습니다. 
- 혼자서 하는거다 보니 스케쥴을 유동적으로 활용해 탄력있게 운용을 할 수 있었으나 그 때문에 더욱 나태해짐을 느끼기도 했습니다.

- 하나의 벽에 가로막히면 그걸 해결하기 위해 노력해보다가 지쳐 외면하곤 했고 그럴 때 마다 다른분들이 새벽까지 열심히 하시는 모습을 보며 마음을 다잡기도 했습니다.

- 어찌저찌 완성은 했으나 아쉬움이 많이 남는건 어쩔수 가 없는거 같습니다!

- 이번 프로젝트를 통해 많이 부족함을 느끼기도 했고 이 열등감을 승화시켜 더욱 발전되는 모습이 될거라 믿습니다🥺
