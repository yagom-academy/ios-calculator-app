# 🧮계산기

## 📚목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)

<br/>

## 1. 소개
연산자를 통한 수식을 계산할 수 있는 프로그램

### Model

- **CalculatorItemQueue**
    - **피연산자와 연산자를 담기 위한 더블 스택 큐 구현**
        <br/>
        > * dequeueStack과 enqueueStack을 통해 값들을 담아줄 수 있는 큐 구현
        > * 각각의 Stack에 값이 담겨져 있는지 확인하기 위한 isEmpty프로퍼티 구현

- **ExpressionParser**
    - **피연산자와 연산자를 구분해주는 메서드 구현**
        <br/>
        > * componentsByOperators 메서드로 피연산자와 연산자 구분
        > * parse 메서드로 구분된 피연산자와 연산자를 큐에 넣음

- **Formula**
    - **피연산자와 연산자를 계산해주는 메서드 구현**
        <br/>
        > * 피연산자 큐와 연산자 큐에서 값을 꺼내와 계산

- **Operator** 
    - **연산자의 케이스를 나누어주는 열거형 구현**
        <br/>
        > * 연산자 케이스 별로 계산 구현

- **Extension split**
    - **연산자를 기준으로 피연산자 구분하는 메서드를 Extension String으로 구현**
        <br/>
        > * 연산자를 기준으로 피연산자를 나누고 배열에 담음
       

### Tests    
- **CalculatorTests**
    - **CalculatorItemQueue 테스트 케이스 구현**
        <br/>
        > * isEmpty프로퍼티 테스트 구현
        > * enqueue메서드 테스트 구현
        > * dequeue메서드 테스트 구현

- **ExpressionParserTests**
    - **ExpressionParser 테스트 케이스 구현**
        <br/>
        > * parse메서드 테스트 구현
        > * component메서드 테스트 구현


- **FormulaTests**
    - **Formula 테스트 케이스 구현**
        <br/>
        > * result메서드 테스트 구현
        
- **OperatorTests**
    - **Operator 테스트 케이스 구현**
        <br/>
        > * Operator에 있는 모든 메서드 테스트 구현

- **SplitTests**
    - **Split 테스트 케이스 구현**
        <br/>
        > * 선택한 Character로 String 분리 테스트 구현


### ViewController
- **CalculatorViewController**
    - **UI 구현**
        <br/>
        > * 연산을 위한 버튼 구현
        > * 연산값 표현해주는 Label 구현
        > * 연산기록 표현해주는 ScrollView, StackView 구현

<br/>




## 2. 팀원


| 송준 | 
| :--------: | 
|   <Img src = "https://i.imgur.com/9Bd6NIT.png" width="200" height="200"/> |
| <center>Solo</center>  |     
| <center>[Github Profile](https://github.com/kimseongj)</center> |



</br>

## 3. 타임라인
**프로젝트 진행 기간** 
- **23.01.24 (화) ~ 23.02.04 (금)** 

> 23.01.24 (화) : STEP 1. 진행 (Array Queue구현) <br/>
> 23.01.25 (수) : STEP 1. 진행 (Double Stack Queue구현) <br/>
> 23.01.26 (목) : PR 피드백을 통한 STEP 1. 코드 리팩토링  <br/>
> 23.01.27 (금) : STEP 2. 진행 (입력된 값을 큐에 담아주는 로직 구현) <br/>
> 23.01.30 (월) : STEP 2. 진행 (UML 작성, Unit Test 진행) <br/>
> 23.01.31 (화) : PR 피드백을 통한 STEP 2. 코드 리팩토링 <br/>
> 23.02.01 (수) : STEP 3. 진행 (ViewController 로직 구현) <br/>
> 23.02.02 (목) : STEP 3. 진행 (예외사항 처리) <br/>
> 23.02.03 (금) : PR 피드백을 통한 STEP 3. 코드 리팩토링  <br/>


<br/>

## 4. 프로젝트 구조
#### UML
![step3-UML](https://user-images.githubusercontent.com/88870642/215417733-649dd90d-c003-4b0b-bedb-cbad7ea2e8fd.jpg)

#### 파일 구조
```
├── Calculator
│   ├── Controller
│   │   ├── AppDelegate.swift
│   │   ├── CalculatorViewController.swift
│   │   └── SceneDelegate.swift
│   ├── Info.plist
│   ├── Model
│   │   ├── CalculatorItemQueue.swift
│   │   ├── ExpressionParser.swift
│   │   ├── Extension
│   │   │   ├── Double+Extension.swift
│   │   │   ├── Operator+Extension.swift
│   │   │   └── String+Extension.swift
│   │   ├── Formula.swift
│   │   └── Operator.swift
│   └── View
│       ├── Assets.xcassets
│       └── Base.lproj
│           ├── LaunchScreen.storyboard
│           └── Main.storyboard
└── CalculatorTests
   ├── CalculatorTests.swift
   ├── ExpressionParserTests.swift
   ├── FormulaTests.swift
   ├── OperatorTests.swift
   └── SplitTests.swift

```

<br/>

## 5. 실행 화면(기능 설명)
| <center>계산 실행</center> | <center>AC취소 실행</center> | <center>EC 취소 실행</center> |
|----|----|----|
|![정상동작화면](https://user-images.githubusercontent.com/88870642/216573385-e4747450-fb59-46c0-83cd-129aae82d5a3.gif)| ![ac버튼 동작화면](https://user-images.githubusercontent.com/88870642/216574132-27ab7010-b05a-43d5-ad7c-8d5c0d35885d.gif) | ![ec버튼 동작화면](https://user-images.githubusercontent.com/88870642/216574459-70c3fc96-3b91-46a0-93d4-f986db84b836.gif) |
|<center>기본적인 연산식을 계산하고 결과를 반환한다.</center>| <center>AC버튼을 눌러서 모든 값을 초기화시킨다.</center>|<center>EC버튼을 눌러 현재의 피연산자를 삭제시킨다.</center>

<br/> 

## 6. 트러블 슈팅
### STEP 1.

<details>
<summary>Array? DoubleStack?</summary>

1. **Array**
- Queue를 구현함에 있어 어떤 방법을 채택할지 고민해봤습니다!
- Array를 사용할 경우 DoubleStack에 비해 코드가 간결하다는 이점이 있었습니다. 
- Array를 사용한 Queue는 데이터를 pop할 경우 빈 인덱스가 생기게 되고, 인덱스를 앞으로 당겨줘야 합니다.
- 이 때 시간복잡도는 O(n)으로 다른 방법을 채택할 경우 보다 시간복잡도가 높습니다.
- 이를 해결하기 위해 pop된 index에 nil값을 넣어서 head를 통해 표시해주고 일정량이 되었을 경우 삭제해주는 방법이 있습니다.
- Array로 만든 Queue 코드
```swift
struct CalculatorItemQueue<T> {
    
    var queue: [T?] = []
    var head: Int = 0
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(item: T) {
        queue.append(item)
    }
    
    mutating func dequeue() -> T? {
        guard head <= queue.count, let item = queue[head] else { return
            
            nil }
        queue[head] = nil
        head += 1
        
        if head > 10 {
            queue.removeFirst(head)
            head = 0
        }
        return item
    }
}
```

2. **DoubleStack**
- DoubleStack의 경우 시간복잡도 O(1)로 Array보다 시간복잡도가 낮습니다.
- 비교적 Array보다 복잡한 코드를 작성해야 합니다.
- TestCase를 작성할 때, enqueue매서드와 dequeue매서드의 의존성이 높았습니다.

Queue를 Array로 head를 사용하여 구현할 경우, 결국 nil인 값을 삭제해줘야 된다는 점을 생각해보면 DoubleStack을 사용하는게 좋아보입니다.
</details>
    
### STEP 2.
<details>
<summary>1. split(with target: Character) -> [String]메서드의 역할 </summary>
<br/>
split메서드에서 target에 어떤 값을 받아올지 정말 고민을 많이 했습니다. operator들을 받아올지, 빈칸을 받아올지에 대한 고민이었습니다. componentsOfOperators 메서드는 메서드명 문맥상 split을 사용하여 operator를 기준으로 operand들을 분리해줘야 된다고 생각되었습니다. 그래서 split에서 operator를 파라미터로 받기로 결정했습니다. 

</details>
<br/>
<details>
<summary>2. 음수처리 </summary>
<br/>
split메서드에 operator들을 받아오기 때문에 음수처리에 각별히 신경써야 했습니다.
제가 사용한 방식은 "⎼"이라는 특수문자로 입력 받고 parse메서드 내부에서  "⎼"를 "-"로 바꾸는 형식을 채택했습니다. 또한, for문을 사용하여 처리했었는데, 고차함수를 통해 간결하고 가독성 있는 코드를 완성했습니다.

#### - 고차함수 사용 전
```swift
var separatedOperands = componentsByOperators(from: input)
for i in 0..<separatedOperands.count {
    if separatedOperands[i].contains("⎼") {
        separatedOperands.replacingOccurrences(of: "⎼", with: "-")
    }
}
```

#### - 고차함수 사용 후
```swift
var separatedOperands = componentsByOperators(from: input)
        
        separatedOperands = separatedOperands.map{ if $0.contains("⎼") { return $0.replacingOccurrences(of: "⎼", with: "-")} else {
            return $0
        } }
```

</details>    
    
    
<br/>
<details>
    
<summary>3. enum의 rawValue로 enum case값 불러오기 </summary>
<br/>
Operator의 case rawValue를 통해 Operator의 case값들을 불러오는 과정이 있었습니다. 
조사해본 결과 아래와 같이 case값들을 얻을 수 있었습니다.
    
```swift 
enum Shoes: String {
    case nike = "나이키"
    case adidas = "아디다스"
    case converse = "컨버스"
}

let a = Shoes(rawValue: "나이키")
```
</details>   
    
    
    
### STEP 3.
<details>
<summary>1. scrollView에서 contentViewSize가 커지면 현재 계산식이 가려지는 문제점 </summary>
<br/>
위 문제를 해결하기 위해 아래와 같은 방법을 사용했습니다. 
- bound는 기준이 자기 자신이며, scrollView의 contentSize.height에서 현재 scrollView.bounds.height를 빼주어서 CGPoint를 지정해주었습니다. 
    
```swift
expressionScrollView.setContentOffset(
            CGPoint(x: 0, 
                    y: expressionScrollView.contentSize.height - expressionScrollView.bounds.height),
            animated: true)
````

- 이 때 문제점은 설정은 제대로 되었지만, 바로 적용되지 않는 오류가 발생합니다. 이를 해결하기 위해 layoutIfNeeded()라는 메서드를 호출했습니다.
- layoutIfNeeded() 함수를 사용하여, 즉각적인 화면의 변화를 나타내줍니다.
```swift
expressionScrollView.layoutIfNeeded()
```
</details>
<br/>
    
<details>
<summary>2. 함수 분리 </summary>
<br/>
숫자버튼과 (.), 0, 00버튼의 분리 안하고 모두 같은 IBAction으로 받았습니다. (.), 0, 00버튼은 예외사항이 많아 추가적인 함수가 많이 필요했습니다. 또한, 하나의 IBAction으로 모든 예외사항을 처리해야 하다보니 가독성이 많이 떨어지게 되었습니다.
예외사항이 많아질거 같은 함수나 프로퍼티는 따로 정의해야할 필요성을 느꼈습니다.
    
</details>
    
## 7. 참고 링크
- [Protocol - Swift Laguage Guide](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [Closures - Swift Language Guide](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
- [Extension - Swift Laguage Guide](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
- [Queue - 개발자 아라찌](https://apple-apeach.tistory.com/8)
<br/>



