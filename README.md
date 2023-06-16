###### tags: `7주차` `계산기` `README`
# ➗✖️ 계산기 ➕➖

> 프로젝트 기간 :  2023.06.12 ~ 2023.06.16


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

    사용자로부터 입력받은 숫자와 연산자를 활용하여 순차적으로 연산을 진행합니다.
    - 주요 개념: `UIKit`, `Queue`, `Linked-List`

<br>

<a id="2."></a>

## 2. 👤 팀원

| [Serena 🐷](https://github.com/serena0720) | [yyss99 🥹](https://github.com/yy-ss99)|
| :--------: | :--------: |
| <Img src = "https://i.imgur.com/q0XdY1F.jpg" width="450"/>| <Img src = "https://hackmd.io/_uploads/HypGZ8YP3.png" width="450"/>|

<br>

<a id="3."></a>
## 3. ⏱️ 타임라인

<details>
<summary>타임라인</summary>

|날짜|내용|
|:---:|---|
| **2023.06.13** |▫️ componentsByOpertators 함수 병합 <br> ▫️ ExpressionParser 함수 병합 <br> ▫️ CalculatorError 파일 생성 <br> ▫️ CaculatorViewController 버튼 기능 구현 <br> ▫️ CaculatorViewController 익스텐션 구현  <br> ▫️ viewdidload 초기값 세팅 |
| **2023.06.14** |▫️ ExpressionParserTests 생성 |
| **2023.06.15** |▫️ CalculatorNameSpace enum 생성 <br>▫️ tapSerialZeroButton 함수 삼항연산자 삭제 <br>▫️ tapOperatorButton 함수 기능 분리 |
| **2023.06.16** |▫️ NameSpace 수정 및 추가 <br> ▫️ addFormulaStackView 함수 기능 분리 <br> ▫️ clearFormula 함수 기능 분리 <br> ▫️ configureFormulaStackView 함수로 기능 분리 |

    
</details>

<br>

<a id="4."></a>
## 4. 📊 다이어그램
<Img src = "https://hackmd.io/_uploads/B1NmkYKDn.png" width="700"/>




<br>

<a id="5."></a>
## 5. 📲 실행 화면
| 0인 상태에서 연산자 입력 | .에 대한 예외처리 | 소수점끼리 연산 |
|:---:|:---:|:---:|
|<Img src = "https://hackmd.io/_uploads/BkxeoDKv3.gif" width="200"/> | <Img src = https://hackmd.io/_uploads/H1jNswFP3.gif width="200"/>| <Img src = "https://hackmd.io/_uploads/SyFKsDtDn.gif" width="200"/>|
| **무한 소수점 출력 </br> (15번째 소수점에서 반올림)** | **NaN 출력** |**숫자 00 입력** |
|<Img src = "https://hackmd.io/_uploads/Byvq3vYPh.gif" width="200"/> | <Img src = "https://hackmd.io/_uploads/H1HER_FDh.gif" width="200"/>| <Img src = "https://hackmd.io/_uploads/rkOfRwYv2.gif" width="200"/>|
| **AC/CE** | **마이너스 부호 변환** | **FormulaStack 자동 스크롤** |
|<Img src = "https://hackmd.io/_uploads/rJyD0wYPn.gif" width="200"/> | <Img src = https://hackmd.io/_uploads/ryJcAPtvn.gif width="200"/>| <Img src = "https://hackmd.io/_uploads/SJkzlwYPh.gif" width="200"/>|




<br>

<a id="6."></a>
## 6. 🛎️ 트러블 슈팅

### 🔥 자료 구조 선택

#### 더블 스택 큐 vs 단방향 연결 리스트
**단방향 연결리스트**
- 단방향 연결리스트는 배열에 비해 데이터 추가 및 삽입이 용이합니다. head와 tail을 이용해서 추가할 노드와 삭제할 노드를 관리합니다.
- 메모리를 효율적으로 사용가능합니다. value가 있을 때만 Node를 만들어서 추가하기 때문에 value에 nil이 들어가는 경우는 생기지 않습니다.
- 하지만 단점으로는 인덱스 접근이 불가하고, 특정 정보값을 찾기 위해서는 처음부터 끝까지 값을 순회해야 합니다.

**더블 스택 큐**
- 기존의 array와 동일하게 enqueue를 진행하지만 dequeue를 진행하는 방법에서 차이를 보입니다. dequeue 시 2개의 Array를 사용하여 stack의 특성인 Last-in-First-out을 구현합니다. 기존의 배열을 뒤집어 새로운 배열에 저장한 뒤 기존의 배열을 삭제하고 .popLast를 사용하여 뒤집힌 배열의 마지막요소를 추출합니다. dequeue 시 .popLast를 사용함으로 시간 복잡도는 O(1)로 줄일 수 있습니다.
- 하지만 기존의 배열을 뒤집어서 새 배열에 할당하는 작업의 시간복잡도가 O(n)이기 때문에, 이를 사용하는 경우 시간 복잡도가 높아진다는 단점이 있습니다. 즉 이 방법은 조건별 시간 복잡도가 다르다는면에서 효율적인 방법이 아니라고 생각될 수 있습니다.
 
→ 계산기 구조 상 큐 안에서 특정 값을 찾아내거나 인덱스로 접근할 필요는 없기 때문에 단방향 연결리스트가 더 효율적일 수 있다 생각하여 이 구조로 코드를 합쳤습니다.
      
<br>
      
### 🔥 Double의 특성을 활용한 부동소수점 문제 해결
- 부동소수점은 10진수의 숫자를 2진수로 표현하는 방법으로, double의 경우 64비트이기떄문에 15자리 숫자가 넘게되면 오차가 커지게 됩니다. 이 문제를 해결하고자 double의 자리수를 NumberFormatter를 사용하여 15자리로 맞추었습니다.


<details>
<summary>콤마를 포함하여 19자리로 자리수 제한</summary>

```swift
    @IBAction private func tapNumbersButton(_ sender: UIButton) {
    guard ...
          currentNumberLabelText.count < 19 else { return }
```
    
</details>
<br>

### 🔥 조건문의 조건을 정리하여 보다 간결한 코드 작성
- 계산기에 여러 예외처리를 위한 조건문을 사용하다보니 코드의 들여쓰기가 많아지게되었습니다. 이때 조건들을 정리하여 보다 간결하게 코드를 수정하였습니다.
    
    

<details>
<summary>수정 전</summary>
        
```swift
 if isComputable {
            guard let inputNumberText = sender.titleLabel?.text,
                  let numberLabelText = inputNumberLabel.text,
                  let operatorLabelText = inputOperatorLabel.text else { return }

            let numberLabelTextWithoutComma = numberLabelText.replacingOccurrences(of: CalculatorNamespace.Comma,
                                                                                   with: CalculatorNamespace.Empty)

            if numberLabelText.count < 20 {
                inputOperatorLabel.text = (formulaListStackView.subviews.isEmpty) ? (CalculatorNamespace.Empty) : operatorLabelText
                if numberLabelText == CalculatorNamespace.Zero {
                    inputNumberLabel.text = inputNumberText
                } else {
                    let resultNumberText = numberLabelTextWithoutComma + inputNumberText
                    let doubleNumberText = Double(resultNumberText)
                    inputNumberLabel.text = calculatorNumberFormatter.string(for: doubleNumberText)
                }
```
                               
</details>
    
    
<details>
<summary>수정 후</summary>
    
```swift
 guard let inputNumberText = sender.titleLabel?.text,
       let numberLabelText = inputNumberLabel.text else { return }

        let numberLabelTextWithoutComma = numberLabelText.replacingOccurrences(of: CalculatorNamespace.Comma,
                                                                               with: CalculatorNamespace.Empty)

        if isComputable, numberLabelText.count < 19 {
            if numberLabelText == CalculatorNamespace.Zero {
                inputNumberLabel.text = inputNumberText
            } else {
                let resultNumberText = numberLabelTextWithoutComma + inputNumberText
                let doubleNumberText = Double(resultNumberText)
                inputNumberLabel.text = calculatorNumberFormatter.string(for: doubleNumberText)
            }
```
</details>                                                  
<br>

### 🔥 매직 넘버와 매직 리터럴 사용하지 않기
- 매직 넘버와 매직 리터럴 사용 시, 코드를 만든 본인이 아닌 다른 사람이 봤을 때 어떠한 의도와 어떤 규칙을 지키기 위해 쓰였는지 알기 어렵습니다. 가독성을 위해 CalculatorViewController 네임 스페이스를 만들어서 해결했습니다.


<details>
<summary> 네임스페이스 코드 </summary>

```swift
extension CalculatorViewController {
    private enum CalculatorNamespace {
        static let empty: String = ""
        static let zero: String = "0"
        static let nan: String = "NaN"
        static let minus: String = "-"
        static let doubleZero: String = "00"
        static let dot: String = "."
        static let equal: String = "="
        static let comma: String = ","
    }
    
    private enum AlertText {
        static let errorTitle: String =  "계산 오류입니다."
        static let errorMessage: String = "확인 버튼을 눌러주시기 바랍니다."
        static let errorConfirm: String = "확인"
    }
}
```
</details>
<details>
<summary> 예시코드 </summary>
Before)

```swift
let formattedNumberText = numberLabelText.replacingOccurrences(of: ",", with: "") + inputNumberText
```

After)
```swift
let formattedNumberText = Double(numberLabelText.replacingOccurrences(of: CalculatorNamespace.Comma, with: CalculatorNamespace.Empty) + inputNumberText)
```
</details>
<br>


<a id="7."></a> 
## 7. 🔗 참고 링크
- [🍎 Apple Docs: Generic Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/#Generic-Types)
- [🍎 Apple Docs: Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
- [🍎 Apple Docs: Character](https://developer.apple.com/documentation/swift/character)
- [🍎 Apple Docs: Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ViewswithIntrinsicContentSize.html#//apple_ref/doc/uid/TP40010853-CH13-SW1)
- [🍎 Apple Docs: protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [🍎 Apple Docs: Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
- [🍎 Apple Docs: Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
- [🍎 Apple Docs: Closure](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
- [🍎 Apple Docs: Advanced Operators](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html)
- [🍎 Apple Docs: Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [🍎 Apple Docs: Subscripts](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html)
- [📘 Blog: 큐 구현하기](https://babbab2.tistory.com/84)
- [📘 Blog: Swift로 구현한 Queue 와 더블스택](https://apple-apeach.tistory.com/8)
- [📘 Blog: 단방향 연결 리스트(LinkedList) 구현 해보기](https://babbab2.tistory.com/86)
- [📘 Blog: 제네릭 (Generics)](https://jusung.gitbook.io/the-swift-language-guide/language-guide/22-generics)
- [📘 Blog: removeAllvs[]](https://limjs-dev.tistory.com/92)


<br>

<a id="8."></a>
## 8. 💭 회고
### 👏🏻 우리팀이 잘한 점
- 기존에 완성한 코드를 병합하는 것이기 때문에, 소통을 하는 데에 집중하였습니다. 하지만 서로의 의견을 잘 어필하고 수용하며 병합하는 과정에서 크게 마찰없이 진행되었습니다.
- 적극적으로 새로운 것을 찾고 공부하였습니다. 계산기에서 나타날 수 있는 오류들을 더 고민하고 
        
### 💜 서로에게 좋았던 점 피드백
- Dear. yyss99 🥹 
    - 차분하고 꼼꼼하여 세심한 부분을 잘 챙겨주셨습니다.
    - 팀프로젝트에 열정적으로 참여해주셨습니다.
    - 시간 약속을 잘 지켜주십니다.
    
- Dear. Serena 🐷
    - 코드에 대해 자세하고 친절하게 설명해주셨습니다.
    - 프로젝트에 있어서 적극적으로 참여해주셔서 팀 활동에서 배우는 것이 많았습니다.
    - 연락이 잘되고 즉각적으로 답장해주셨습니다.
