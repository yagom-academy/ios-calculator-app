# 계산기 ➕➖✖️➗

# 목차
[1. 프로젝트 소개](#1-프로젝트-소개)<br>
[2. 팀원](#2-팀원)<br>
[3. 타임라인](#3-타임라인)<br>
[4. 시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조)<br>
[5. 실행 화면](#5-실행-화면)<br>
[6. 트러블 슈팅](#6-트러블-슈팅)<br>
[7. 참고 링크](#7-참고-링크)<br>

<br>

## 1. 프로젝트 소개
LinkedList와 Queue를 활용해 사칙연산을 가능한 계산기 앱

<br>

## 2. 팀원

| Harry |
|:----:|
| <img src="https://i.imgur.com/BYdaDjU.png" width="130" height="130"/> |
| [<img src="https://i.imgur.com/ASJUne5.png" width="22"> Github](https://github.com/HarryHyeon) |

<br>

## 3. 타임라인

- 23.01.24(화) ~ 23.01.26(목) - TDD로 프로젝트 진행
    - 큐의 자료구조로 사용할 링크드리스트 구현
    - 연산자와 피연산자를 담을 큐 구현
    - Unit Test로 코드 검증
- 23.01.27(금) ~ 23.01.30(화) - TDD로 프로젝트 진행
    - 사칙 연산자들을 하나의 타입으로 정의
    - 입력으로 들어오는 계산식을 숫자와 연산자를 구분하여 큐에 넣는 기능 구현
    - 큐에서 데이터를 꺼내 계산을 할 수 있는 기능 구현
    - Unit Test로 코드 검증
- 23.02.02(목) ~ 23.02.03(금)
    - 사용자의 터치 이벤트를 수신하여 계산을 할 수 있도록 구현
    - 스택뷰와 레이블을 활용하여 계산 내역을 표시
    - 계산내역이 길어지면 스크롤뷰를 활용하여 최하단으로 자동 스크롤하는 기능 구현
<br>

## 4. 시각화된 프로젝트 구조
### 폴더 구조
``` swift
Calculator
    ├── App
    │   ├── AppDelegate
    │   └── SceneDelegate
    └── Source
        ├── Controller
        │    └── CalculatorViewController
        ├── Model
        │    ├── CalculateItem
        │    ├── CalculatorItemQueue
        │    ├── LinkedList
        │    ├── Formula
        │    ├── Operator
        │    ├── ExpressionParser
        │    ├── NumberConverter
        │    └── Node
        └── View
             ├── HistoryViewGenerator
             ├── LaunchScreen
             └── Main    
```

<br>

### 클래스 다이어그램
<img src="https://i.imgur.com/gp9bTiN.png">


<br>
<br>

## 5. 실행 화면

- 초기화면에서는 연산자 버튼이 동작하지 않습니다.
- 계산을 시작하고 숫자가 입력되지 않은상태에서는 연산자를 바꿀 수 있습니다.
<img src="https://i.imgur.com/s6iFxX7.gif">

<br>

- 원본 데이터는 숫자가 그대로 저장되지만 화면에 출력되는 숫자는 20자리로 제한하고 20자 이상이 되었을 경우 숫자가 추가될때마다 앞에 숫자가 하나씩 밀려납니다.
<img src="https://i.imgur.com/yg9VKnj.gif">

<br>

- 소숫점 아래 20자까지 표기할 수 있습니다. 그 이상 넘어갈 경우 반올림하여 처리합니다.
<img src="https://i.imgur.com/FH3KPw1.png" width="300">

<br>

- `=` 을 누른 후에 결과값에 계산을 이어서 할 수 있도록 했습니다.
<img src="https://i.imgur.com/A0fCJJP.gif">


<br>

## 6. 트러블 슈팅

<details>
<summary>Array vs LinkedList</summary>

### Array vs LinkedList

이번 계산기 프로젝트에서 필요한 큐의 자료구조를 Array로 할지 LinkedList로 할지 고민을했습니다.

#### Array의 특징

> 동일한 데이터 타입을 하나의 변수에 순서대로 나열한 자료 구조  
> 메모리에 연속적으로 저장이 됨

-   배열의 특정 인덱스의 원소를 접근하는 시간 복잡도 O(1).
    -   메모리에 연속적으로 저장하기 때문에 인덱스를 가진다.
    -   따라서 인덱스를 사용해 특정 원소에 빠르게 접근이 가능.
-   배열의 특정 원소를 삭제할 경우
    -   제일 마지막 원소가 아닌경우에는 삭제후에 빈 자리만큼 앞으로 땡겨줘야하기 때문에  
        시간 복잡도는 O(n)
-   배열에 원소를 삽입할 경우
    -   삽입되는 위치 이후의 요소들을 뒤로 한칸씩 이동시켜야하기 때문에 시간 복잡도 O(n) 소요
-   배열에 원소를 가장 마지막에 추가하는 경우
    -   배열의 인덱스를 이용해 배열의 마지막에 추가 할 수 있으므로 시간 복잡도는 O(n)

#### LinkedList의 특징

> 데이터와 링크로 구성된 노드를 이용하여 메모리에 저장된 순서와 상관없이 연결된 자료구조

-   연결리스트의 특정 노드에 접근
    -   헤드 노드부터 순차적으로 탐색하여 특정요소에 접근해야하므로 O(n)의 시간 복잡도를 가짐
-   연결리스트의 특정 노드를 삽입할 경우
    -   맨 앞과 맨 뒤의 삽입은 헤드와 테일을 알고 있기때문에 시간 복잡도 O(1)
    -   중간에 삽입할 경우 어느 위치에 삽입할 것인지 탐색한 후에 삽입해야하므로 O(n)
-   연결리스트의 특정 노드를 삭제할 경우
    -   맨 앞, 맨 뒤 삽입은 탐색하지 않아도 되므로 O(1)
    -   중간에 위치한 노드를 삭제시에 탐색해야하므로 O(n)

#### 결론: 단방향 LinkedList로 구현

-   계산기 프로젝트에서는 삭제는 큐의 첫번째 데이터에서 발생하기 때문에 배열을 사용했을때 비효율적이라고 생각이 들었습니다.
-   계산기 프로젝트에서 중간에 데이터를 삽입할 경우가 없기때문에 탐색속도는 고려하지 않아도 된다고 생각했습니다.
-   큐의 모든 데이터를 삭제하고 싶을때 배열의 removeAll()을 호출할때 O(n)의 시간 복잡도가 소요되기 때문에 링크드리스트에서는 head와 tail에 nil만 주면 메모리가 해제되기 때문에 배열로 하는 것보다 효율적이라고 생각했습니다.
-  배열로 했을때 한칸씩 앞으로 당겨주는 작업을 해야하기 때문에 차라리 헤드와 테일을 알고있는 링크드리스트가 효율적이라고 생각했습니다.
-  Double Stack Queue라는 것을 공부해보았는데 enqueueStack은 마지막에 비워지고 불필요한 메모리를 상주시킨다고 생각했고 dequeueStack에 reversed() 작업을 추가로 해주어야하기 때문에 이 또한 효율적이지 못하다고 생각을 했습니다.
    
</details>

<br>

<details>
<summary>예외사항 처리</summary>
    
### 유효숫자 20자리로 제한하기
    
**현재 입력받은 숫자를 출력하는 레이블에 NumberFormatter를 사용하면 20자 이상 입력이 안되는 것을 확인함**
- 현재 입력받은 숫자를 출력하는 레이블에는 NumberFormatter를 적용하지 않고 계산 결과가 나오거나 계산내역에 올라갈때 NumberFormatter를 적용하여 `,`와 유효숫자 20자를 지정
- 현재 입력받은 숫자를 출력하는 레이블에는 20자 이상이 넘어가도 원본데이터는 유지한채 보여지는 숫자만 항상 20자가 되도록 구현
    ``` swift
    if currentNumbersLabelText.count > 20 {
                let truncatedText = String(numberText.suffix(20))
                displayNumbersLabel.text = truncatedText
            } else {
                displayNumbersLabel.text = currentNumbersLabelText
            }
    ```

<br>
    
### 계산내역을 표시해주는 스택뷰
**계산내역을 표시해주는 스택뷰에는 연산자를 표시하는 레이블과 숫자를 표시하는 레이블이 있는데, 숫자가 아주 길어질경우 연산자 레이블이 없어지는 현상이 발생**
- 레이블을 생성할때 연산자 레이블에 `setContentCompressionResistancePriority` 메서드를 사용하여 수평으로 줄어들지 않도록 해주었다.

<br>
    
### `=` 버튼을 눌러 계산
**`=`버튼을 눌러 계산을 한 후에도 이어서 계속 계산을 할 수 없는 문제가 있었음**
- `var isCalculated: Bool` 프로퍼티를 활용해 계산이 되었는지를 확인한 다음 숫자 버튼은 입력되지  않도록하고 연산자 버튼으로 계속 계산을 이어나갈 수 있도록 했다.
    
</details>


<br>

# 7. 참고 링크
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Swift Language Guide - Protocol](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [LinkedList - 소들이 블로그](https://babbab2.tistory.com/86)
- [야곰 닷넷 - Unit Test, TDD](https://yagom.net/courses/unit-test-%ec%9e%91%ec%84%b1%ed%95%98%ea%b8%b0/)
- [Apple Docs - UIStackView](https://developer.apple.com/documentation/uikit/uistackview)
- [Apple Docs - UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)
<br>


