# README

# 🧮 🟰 계산기

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [팀 회고](#-팀-회고)

---

## 🍀 소개

`Hemg` 이/(가) 만든 계산기 프로젝트 입니다.

- 주요 개념: `protocols` ,  `extensions`, `Error Handling` , `closures` , `advancedoperators`, `inheritance`, `subscripts` 

---

## 👨‍💻 팀원

| Hemg |
| :---: |
|<Img src="https://user-images.githubusercontent.com/101572902/235090676-acefc28d-a358-486b-b9a6-f9c84c52ae9c.jpeg" width="250" height="300"> |
[Github Profile](https://github.com/hemg2)|


## 👀 시각화된 프로젝트 구조
UML Diagram.jpg

## 💻 실행 화면
| 정상적인 작동 | 소수자리 확인 | 
|:--:|:--:|
|<img src="https://hackmd.io/_uploads/Hk13RLQP2.gif" height="400" width="300">|<img src="https://hackmd.io/_uploads/SyWTRLQwn.gif" height="400" width="300">

| 잘못된 입력 | 0나누기 처리 |
|:--:|:--:|
|<img src="https://hackmd.io/_uploads/S1Tgywmw3.gif" height="400" width="300">|<img src="https://hackmd.io/_uploads/BJdWJv7D3.gif" height="400" width="300">


---

## 🕰️ 타임라인 

| 날짜 | 내용 |
| :---: | :--- |
| 2023.05.29. | 계산기 구현관련된 자료 검색 및 공부 |
| 2023.05.30. | `CalculatorItemQueue` 객체, `CalculatorTests` 테스트객체 생성, 테스트 진행|
| 2023.05.31. | `Queue` -> `LinkedList` 변경 진행, `CalculatorItemQueue`, `strcut` -> `class`  타입 변경 |
| 2023.06.01. | `PR` 피드백 수정 진행 -> `lastItem()`생성 `enqueue`테스트 진행, `countItem` 생성, `enqueue` 테스트 진행 |
| 2023.06.02. | 피드백 코멘트 작성 및 README 작성 |
| 2023.06.05. | UML 수정, extension Type진행 |
| 2023.06.06. | Operator, Formula, ExpressionParse 객체 생성 |
| 2023.06.07. | FormulaTests생성후 테스트 진행, 0 나누기시 실패 처리 |
| 2023.06.08. | split-> components 메소드 변경, CalculatorError생성  |
| 2023.06.09. | ExpressionParser 로직변경, ParserTests 메소드 변경 (result->dequeue) |
| 2023.06.11. | 계산기UI구현, 연산과정 추가, 스택뷰로 인해스크롤뷰 증가 진행, 나누기값이 없을경우 NAN 처리, NumberFormatter추가 |


---

## 📝 트러블 슈팅

### `Queue` 와 `LinkedList`
- 기존 처음 구현을 Queue타입으로 진행했다가 LinkedList로 전환을 하게 되었습니다.
- 링크드 리스트가 데이터의 삽입, 삭제, 검색 등의 연산에 효율적인 자료구조라고 알게 되어 계산기 프로젝트에서 시간 복잡도에서의 이점을 가질수있다고 생각해서 변경을 하게 되었습니다.
- `enqueue`-> `head`의 값을 확인해보고 nil이라면 `head`에 새로 들어온 노드를 연결해주고, `tail`도 nil일테니 여기에도 새로운 노드를 연결해줍니다. 이미 링크드 리스트에 데이터들이 들어있는 경우는 가장 마지막 노드를 가리키는 `tail` 포인터로 찾아가서 `tail`이 가리키는 노드의 다음노드에 새 노드를 연결해준 뒤, `tail`이 가리키는 노드를 새로운 노드로 변경해줍니다. 무조건 `tail`을 참조해서 새노드를 연결만 해주면 되니 항상 O(1)된다고 생각합니다.
- `dequeue`-> `head`을 업데이트하고 값을 반환하므로, 상수 시간 O(1)으로 동작 된다고 생각 합니다.

|시간 복잡도|enqeue|dequeue|
|:------:|:---:|:---:|
|Array|O(1)|O(n)|
|LinkedList|O(1)|O(1)|


### 스택뷰를 스크롤뷰에 추가 함에 있어 하나씩 추가되는 문제를 한꺼번에 추가하게끔 진행
#### 문제 상황
- 스크롤뷰에 스택뷰안에있는 레이블을 쌓는 과정에서 많은 고민을 하게 되었습니다 
```swift
 let newOperatorLabel = UILabel()
        newOperatorLabel.text = operatorsLabel.text
        newOperatorLabel.textColor = .green
        
        let newNumberLabel = UILabel()
        newNumberLabel.text = numberInputLabel.text
        newNumberLabel.textColor = .white
        
        if firstNumberLabel.text?.isEmpty == true {
            firstOperatorLabel?.text = newOperatorLabel.text
            firstNumberLabel?.text = newNumberLabel.text
        }
        
        operatorStackView.addArrangedSubview(newOperatorLabel)
        operatorStackView.addArrangedSubview(newNumberLabel)
```

- 새로운 레이블을 만들어 추가를 해서 스택뷰에 새로이 쌓아 늘릴려고했지만 newOperatorLabel 따로 newOperatorLabel따로 1개씩 쌓여 이부분을 해결하는데에 있어 엄청 큰 고민을 하게 되었습니다.


#### 해결 방안
- 그래서 방법으로 View를 생성하서 View 안에 넣어 한꺼번에 보이게 진행하였습니다. 

```swift
let newOperatorLabel = UILabel()
        newOperatorLabel.text = operatorsLabel.text
        newOperatorLabel.textColor = .white
        newOperatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let newNumberLabel = UILabel()
        newNumberLabel.text = numberInputLabel.text
        newNumberLabel.textColor = .white
        newNumberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        if numberInputLabel.text?.isEmpty == true {
            firstOperatorLabel?.text = newOperatorLabel.text
            firstNumberLabel?.text = newNumberLabel.text
        }
        
        let containerView = UIView()
        containerView.addSubview(newOperatorLabel)
        containerView.addSubview(newNumberLabel)

        operatorStackView.addArrangedSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        newOperatorLabel.translatesAutoresizingMaskIntoConstraints = false
        newNumberLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            newOperatorLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            newOperatorLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            newOperatorLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            newNumberLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            newNumberLabel.leadingAnchor.constraint(equalTo: newOperatorLabel.trailingAnchor),
            newNumberLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            newNumberLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
```


---

## 📚 참고 링크

- [🍎Apple Docs: protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/)
- [🍎Apple Docs: extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions/)
- [🍎Apple Docs: Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
- [🍎Apple Docs: closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/)
- [🍎Apple Docs: advancedoperators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators/)
- [🍎Apple Docs: inheritance](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance/)
- [🍎Apple Docs: subscripts](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/subscripts/)
- [🍎Apple Docs: API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)

---

## 👬 팀 회고

## 우리팀이 잘한 점
- 프로젝트 종료시점에 기재하겠습니다.
## 우리팀 개선할 점
## 서로에게 좋았던 점 피드백
## 서로에게 아쉬웠던 점 피드백
