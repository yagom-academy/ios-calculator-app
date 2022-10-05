# 계산기

## 1. ✏️ 프로젝트 소개
계산기입니다.
-  사칙연산 (+, -, ÷, X)이 가능합니다.
-  연산자 우선순위는 무시합니다
-  계산결과는 Double타입을 사용합니다
- 숫자는 최대 20자리까지만 표현합니다. 

---

## 2. 🤝 팀원 
- 1인 개발

| SunnyCookie |
| ------- |
| <img width="180" src="https://i.imgur.com/z4FjnKX.png"> |

---

## 3. 🔍 프로젝트 구성과 실행예시
- Class Diagram
<img width = 1000, src = "https://i.imgur.com/lnjKDxO.png">

- 실행예시

|정상작동 예시(1)|정상작동 예시(2)
|------------|-----------|
|  <img width = 250, src = "https://i.imgur.com/fS8rX2P.gif">  | <img width = 250, src = "https://i.imgur.com/KZMPWjJ.gif"> |

|`CE`버튼 작동예시 | `AC`버튼 작동예시 |
|-----------|-----------|
|<img width = 250, src = "https://i.imgur.com/9eLFZ8e.gif">|<img width = 250, src = "https://i.imgur.com/cSKQSWe.gif">|

|`+/-` 버튼 작동 예시 | 제일 하단으로 Auto Scrolling 예시 |
|-----------|-----------|
|<img width = 250, src = "https://i.imgur.com/kbu4ugR.gif">|<img width = 250, src = "https://i.imgur.com/eFms2BQ.gif">|

| 나누기 0 시 오류처리 | 소수점 한개 이상 오류처리 |
|-----------|-----------|
|<img width = 250, src = "https://i.imgur.com/yRYaKTn.gif">|<img width = 250, src = "https://i.imgur.com/eSxvqkr.gif">|

---

## 4. ⚒️ 구현 내용

### [ 🚩 Model ]

**1️⃣ 자료구조를 구현하기위한 Queue, LinkedList, Node**

☑️ CalculatorItemQueue 구조체  </br>
☑️ LinkedList 구조체  </br>
☑️ Node 클래스  </br>

<details>
    <summary> [details - 타입별 프로퍼티와 메서드 설명] </summary>

☑️ CalculatorItemQueue 구조체
LinkedList 이용한 FIFO형태의 Queue 자료구조입니다
- `itemQueue`: LinkedList타입으로 갖는 Queue입니다.
- `enqueue()`: Queue의 마지막에 데이터를 추가합니다.
- `dequeue()`: Queue의 맨 앞의 데이터 (제일 먼저 추가되었던 데이터)를 반환하고 삭제합니다.
- `clear()`: Queue의 데이터를 모두 삭제합니다.
- `isEmpty()`: Queue가 비어있는지 Bool타입으로 반환합니다.
☑️ LinkedList 구조체
Node를 이용한 단방향 연결리스트 자료구조입니다.
- `head`: 연결리스의 첫번째 데이터입니다. 
- `last`: 연결리스트의 마지막 데이터입니다.
- `append()`: 리스트의 마지막에 데이터를 추가합니다.
- `removeLast()`: 리스트의 마지막 데이터 (제일 늦게 추가되었던 데이터)를 반환하고 삭제합니다.
- `removeFirst()`: 리스트의 맨 앞의 데이터 (제일 먼저 추가되었던 데이터)를 반환하고 삭제합니다.
- `isEmpty()`: 리스트가 비어있는지 Bool타입으로 반환합니다.
☑️ Node 클래스
- `data`: 필요한 데이터를 저장합니다, 외부에서 읽기만 가능합니다
- `next`: 메모리상에서 또 다른 Node의 주소를 참조합니다.
- `init`: Node의 이니셜라이징 메서드입니다. next는 기본값으로 nil을 갖고있습니다
</details>

</br>

**2️⃣ 계산기의 연산과정**

☑️ Operator 열거형  </br>
☑️ ExpressionParser 열거형  </br>
☑️ Formula 구조체  </br>
☑️ CalculatorItem 프로토콜  </br>

<details>
<summary> [details - 타입별 프로퍼티와 메서드 설명] </summary>
  
☑️ Operator 열거형 
- 연산기호(+, - , ÷ , x)를 rawValue로 갖는 `연산자`들을 case로 갖습니다.
- `add(), substract(), divide(), multiply()` : 연산기능이 담겨있습니다
    -    `divide()`에서는 0으로 나누려고 할 때 오류를 던집니다.
- `calculate`: 원하는 연산case를 self로 받은 후 switch구문을 이용해 연산하는 메서드들을 호출합니다.

☑️ ExpressionParser 열거형
- `parse()`: 문자열에 섞여있는 연산자와 숫자를 나눠서 각각 큐에 담습니다. 담긴 큐들을 갖는 Formula 로 반환합니다. 
- `componentsByOperators()`: `components(separatedBy:)` 를 이용해 연산기호를 기준으로 쪼갠 후 문자열Array로 반환합니다. 
    - 연산기호는 Operator타입의 rawValue를 사용합니다.   
        - `allcases.map{ String($0.rawValue) }` ➡️ String 배열로 반환합니다. 
        - `.joind()` ➡️ 배열을 문자열로 변환합니다.
        - CharacterSet(charactersIn:) ➡️ String을 Character로 형변환합니다.

☑️ Formula 구조체
- `operands`, `operators`: 피연산자와 연산자를 큐로 갖습니다.
- `result()`: 계산 후 결과를 Double로 반환합니다.  

☑️ CalculatorItem 프로토콜
- 타입프로토콜로 사용하기 위한 빈프로토콜입니다.
</details>

</br>

**3️⃣ Extension**

☑️ Extension String  </br>
☑️ Extension Double  </br>

<details>
<summary> [details - 타입별 프로퍼티와 메서드 설명] </summary>
    
☑️ Extension String
- `split()` : 매개변수로 받는 Character를 기준으로 쪼갠 후 문자열 Array로 반환합니다.

☑️ Extension Double
- CalculatorItem 프로토콜을 타입을 채택합니다.
</details>    
  
  </br>
  
**4️⃣ unit test** </br>
<img width=550, src = "https://i.imgur.com/gIbl5Qm.png">


### [ 🚩 ViewController ]
**1️⃣ property**

☑️ formula, result, inputNumber </br>
 
 <details>
<summary> [details - 프로퍼티별 설명] </summary>
    
- `rawFormula`: `=` 버튼을 누를 시 계산해 줄 공식을 담습니다.
- `result`: 계산 결과를 담습니다.
- `inputNumber`: 실시간 input을 보여줍니다. willSet을 이용해 라벨에 표시해줍니다. 값이 비거나, 음수부호일 시에는 0을 표시합니다.(음수부호는 0으로 보여도 뒤에 숫자를 누를 시 음수로 표시됩니다)
 </details>
 
   </br>
 
**2️⃣ IBAction 메서드**

☑️ touchUpNumberButton </br>
☑️ touchUpOperatorButton </br>
☑️ touchUpConvertingPositiveNegativeButton </br>
☑️ touchUpCEButton  </br>
☑️ touchUpACButton </br>
☑️ touchUpResultButton </br>

  <details>
<summary> [details - 메서드 별 기능 설명] </summary>
    
 - `touchUpNumberButton`: 
     - 숫자패드에 반응해 라벨에 띄우기 위해 inputNumber에 담습니다. 
     - `0`버튼과 `00`버튼은 현재값이 0일때 눌러도 여러번 입력되지 않도록 guard문 처리했습니다.
     - `1~9` 버튼은 현재값이 0일때 0을 지우고 숫자가 입력되도록 합니다.
 - `touchUpOperatorButton`:
     - 연산자를 처음 누른다면 거라면 연산자라벨에 누른 연산자를 보여줍니다.
     - 기존에 숫자를 눌렀었다면 이전에 누른 공식을 stackView에 label로 올려주고 
        실시간 input을 보여주는 label은 초기화한 후 연산자라벨에 눌러진 연산자를 보여줍니다.
     - 더불어 나중에 계산을 위해 formula프로퍼티에도 이전에 누른 공식을 추가합니다.
 - `touchUpConvertingPositiveNegativeButton`:
     - 첫번째 자릿수가 마이너스인지 구분하여 음수🔁양수 convert해줍니다.
     - 0일 때는 양수, 음수 convert 되지 않습니다.
 - `touchUpCEButton`:
     - input내용을 지워줍니다.
 - `touchUpACButton`:
     - input내용과 기존 공식들 모두 지워줍니다
 - `touchUpResultButton`:
     - 기존에 `=`을 누른 후 다시 누르는 경우 작동하지 않도록 guard문 처리했습니다.
     - 마지막 input들을 stackView에 label로 올려주고 input을 비워줍니다.
     - 오류처리를 위해 do-catch문으로 결과를 계산해줍니다
     - `divideByZeroError` 시 Nan처리를 위해 numberFormatter의 notANumberSymbol을 사용합니다.
 
</details>

</br>
    
**3️⃣ 메서드**

☑️ addFormula </br>
☑️ MakeOperationStackView </br>
☑️ makeOperatorLabel </br>
☑️ scrollTobottom </br>
☑️ changeStyle </br>

<details>
<summary> [details - 메서드 별 기능 설명] </summary>

- `addFormula`
     - 계산을 위해 formula 프로퍼티에 값을 담습니다.
     - (3-2) 를 (+3-2)로 담기위해 if문으로 라벨이 비어있을 때는 +를 담아줍니다.
- `MakeOperationStackView`:
    - UIStackView를 생성하고 특성을 정해줍니다.
    - 연산자 라벨과 피연산 라벨을 horizontal axis로 담습니다.
    - `showingOperationsStackView`의 맨 뒤에 추가해줍니다.
- `makeOperatorLabel`, `makeOperandLabel`
    - UILabel을 생성하고 특성을 정해줍니다.
    - 각각 현재 입력된 연산자, 피연산자를 text로 갖습니다.
- `scrollTobottom`
    - scrollView를 자동으로 제일 하단에 위치하도록 합니다.
    - setContentOffset만 사용할 시 제일 하단 한 줄이 나오지 않는 문제가 있어 layoutIfNeeded()를 이용해 보류 중인 레이아웃 업데이트가 될 떄까지 기다린 후 스크롤을 아래로 내려주도록 합니다.
- `changeStyle`
    - 계산결과값에 NumberFormatter를 이용해 필요 스타일을 잡아줍니다.
    - 1000의 자리마다 쉼표를 추가하고 20자리까지만 표기합니다. 잘리는 숫자는 반올림 해줍니다.

</details>

</br>

**4️⃣ Text 구조체** </br>
☑️ 기본텍스트를 상수로 사용하기 위한 구조체

</br>

---

## 5. ✅ 프로젝트 수행 중 경험하고 배운 것
- UML 작성하기 </br>
    ☑️ class Diagram 으로 타입 구현내용과 타입간의 관계 그려보기 </br>
- 주어진 UML에 맞게 코드 구현해보기 </br>
    ☑️ 주어진 Class Diagram을 기반으로 한 코드 구현해보기 </br>
- TDD 기반으로 진행하기 </br>
    ☑️ [unit test 실패 ➡️ 성공 ➡️ 리팩토링] 과정을 통해 기능 구현해보기 </br>
    ☑️ 리뷰 후 테스트의 fail도 확인할 수 있도록 의도한 fail test 구현해보기 </br>
- 자료구조 Queue, 연결리스트 구현하기 </br>
    ☑️ Queue와 연결리스트 대한 개념, 원리를 배우고 코드로 구현해보기  </br>
- 고차함수 사용하기 </br>
    ☑️ map, compactMap 사용하기 </br>
    ☑️ 옵셔녈바인딩대신 compactMap을 사용할 수 있음 </br>
- UIStackView 코드로 다뤄보기 </br>
    ☑️ 코드로 stackView생성과 특성을 지정해주기 </br>
- UIlabel 코드로 다루기 </br>
    ☑️ 코드로 UILabel생성과 특성을 지정해주고 stackView에 add해주기 </br>
- scrollView 다루기 </br>
    ☑️ 실제 컨텐츠 사이즈에서 원하는 bound의 위치로 CGPoint를 이용해 스크롤 이동하기 </br>
- NumberFormatter() 포매터 사용하기 </br>
    ☑️ 1000의 자리마다 쉼표, 유효숫자, NaN사용, 소숫점 처리 파라미터 이용하기 </br>

---

## 6. 🔥 트러블 슈팅
### 1️⃣ Queue 구현에 사용 할 자료구조 
`CalculatorItemQueue` 클래스 내부에서 연산자와 숫자를 저장할 큐에 사용할 자료형식으로 처음엔 `배열(Array)`을 사용했다가 `단방향 연결리스트(Linked List)`로 수정했습니다.

**1-1 Queue의 자료형식으로 배열(Array)을 사용한다면 ?**
   <details>
        <summary> [details] </summary>    

- 배열을 이용하면 index로 데이터에 접근할 수 있어서 index를 알고있다면 데이터에 빠르게 접근할 수 있다는 장점이있습니다.
- 하지만, Queue는 FIFO(First In First Out)방식이기 때문에 index 0 부터 삭제될텐데 그 때마다 Array안에서는 element의 인덱스를 하나씩 땡겨서 재배치하는 작업때문에 오버헤드가 발생하는 단점이 있습니다.
- 📌배열을 사용했을 때 CalculatorItemQueue 코드   
    ```swift
    struct CalculatorItemQueue {
    var itemQueue: [(arithmetics: String, number: Int)?] = []
    .
    .
    ```    
    - 배열(Array)의 data로 `튜플`을 사용했었습니다. 
    - 튜플원소에 이름을 주어 연산자(arithmetics)와 숫자(number)를 구분했었습니다. 
   - 전체 코드는 아래와 같습니다. Array에서 쓸 수 있는 메서드와 index로 접근하는 방식으로 queue를 구성했었습니다.        
    ```swift
    struct CalculatorItemQueue {
        var itemQueue: [(arithmetics: String, number: Int)?] = []
        var index:Int = 0

        mutating func enqueue(_ data: (String, Int)) {
            itemQueue.append(data)
        }

        mutating func dequeue() -> (String, Int)? {
            guard let data = itemQueue[index] else {
                return nil
            }

            itemQueue[index] = nil
            index += 1

            return data
        }

        mutating func clear() {
            itemQueue.removeAll()
            index = 0
        }
    }
    ```  
    </details>

</br>

**1-2 Queue의 자료형식으로 LinkedList를 사용한다면 ?**
  <details>
        <summary> [details] </summary>
    
- 배열에서 설명한 오버헤드에 대한 단점을 보완할 수 있습니다
- 연결리스트는 서로 떨어진 공간에 존재하는 데이터를 연결해 놓았기 때문에 첫번째 데이터가 삭제되어도 재배치에 발생하는 오버헤드가 발생하지 않습니다.
- 하지만 배열처럼 인덱스로 접근하지 못하고 첫번째 데이터부터 순차적으로 접근해야해서 접근속도가 느리다는 단점이 있습니다. 
- 이를 보완하기 위해서 양쪽에서 탐색할 수 있는 양방향연결리스트를 고려할 수 있습니다
</details>

</br>

**1-3 그렇다면 단방향 연결리스트를 쓸까 양방향 연결리스트를 쓸까?**
<details>
<summary> [details] </summary>

- 양방향 연결리스트는 단방향 연결리스트의 탐색시간이 느리다는 단점을 보완하기 위해 사용하는데 계산기 프로젝트에서는 탐색할 일이 없어서 **✅ 단방향연결리스트를 사용했습니다.**
- 프로젝트 요구사항을 보면 `연산은 연산자 우선순위를 무시하고 앞에서부터 순서대로 계산합니다.` 라고 되어있기 때문에 queue에서 중간에 있을 곱하기와 나누기를 탐색할 일이 없습니다. 

</details>

</br>

### 2️⃣ LinkedList의 head를 nil했을 때 연결되어있던 다른 메모리들은 어떻게 될까 ?
> 리뷰어의 질문
> " 나머지는 메모리에 존재하지 않을까요 ? 👀 ""

결론적으론 head Node 에 연결되어 있는 next Node 들은 `ARC`에 의해 자동으로 메모리에서 삭제됩니다.

<details>
        <summary> [details] </summary>

LinkedList 에서는 전부 지워줄 때 head를 nil을 해줍니다.
```swift
mutating func clear() {
        itemQueue.head = nil
    }
```
Node는 Class로 구현되어있기 때문에 Heap영역에 메모리가 할당되고, 
Heap영역의 메모리를 관리해주는 ARC에 의해 메모리에서 자동으로 삭제됩니다.

ARC의 기본원칙은 
- 주소가 참조될 때 RC +1이되고,
- RC = 0일 때는 자동으로 메모리에서 지우는것입니다.

말로하는 것보다 그림이 편할 것 같아서 그림으로 그려보았습니다.
예를들어 3개의 데이터가 LinkedList로 연결되어있고, head를 nil 시켰을 때 메모리의 상태를 차례대로 그렸습니다. 

<img width = 400 src = "https://i.imgur.com/iI8RpHc.png">

- Struct인 LinkedList는 head를 스택영역에 저장하고, head의 값으로 힙영역의 첫번째노드의 주소를 갖고있으면서 RC를 +1해줍니다.
- 첫번째 노드의 next에는 다음 노드의 주소를 참조하고, 이 때문에 두번째 노드의 RC도 1이됩니다.
- 세번째 노드도 두번째 노드의 next에 주소가 참조되어있기 때문에 RC가 1이됩니다.

<img width = 400 src = "https://i.imgur.com/wmO9xLl.png">

- head가 nil이 되면 첫번째 노드의 주소가 사라지므로 RC -1해주고 첫번째 노드의 RC가 0이 됩니다

<img width = 400 src = "https://i.imgur.com/EINOp3I.png">

-첫번째 노드는 RC가 0이라 메모리에서 지워지고 연쇄작용으로 next에서 참조하던 두번째 노드의주소가 지워지면서 두번째 노드의 RC도 0으로 만들어줍니다.

<img width = 400 src = "https://i.imgur.com/8g5HhTJ.png">

- 연쇄작용으로 세번째 노드도 RC가 0이됩니다.

<img width = 330 src = "https://i.imgur.com/1QCDZwO.png">

- 결과적으로 모든 데이터들이 메모리에서 지워지게 됩니다.
</details>
    
### 3️⃣ 문자열을 나누는 방법인 split과 components 사이에서 고민

4개의 연산자기호를 기준으로 문자열을 쪼개야 했기 때문에 split보다는 `components(separatedBy: [CharacterSet])`을 사용하는 게 더 좋다고 판단했습니다.

<details>
  <summary> [details] </summary>

주어진 UML에 extension String이 있었고, split 메서드를 만들어 주어야 했습니다. 
기존 `split`메서드가 `[subString]`을 반환하는 걸 사용하지 못해서 `[String]`으로 반환하는 메서드를 새로 만들어 주는 방향으로 나온 UML이지 않을까 생각했습니다.

사용이 유력했던 `componentsByOperators` 메서드에서는 4개의 연산자기호를 기준으로 쪼개야 했기 때문에 split보다는 `components(separatedBy: [CharacterSet])`을 사용하는 게 더 좋다고 판단했습니다.
 </details>

### 4️⃣ `components(separatedBy:)` 에 `Operator` case의  rawValue 사용하는 방법

문자열을 네가지 기호 +, - , ÷ , x를 기준으로 쪼개주기 위해 components(separatedBy:)메서드를 사용했습니다.
이 때 기호들이 이미 Operato 열거형에서 각case의 rawValue로 갖고있어서 그것을 이용할 수 있는 코드를 만들고 싶었습니다.
결론적으론 `CharacterSet`타입으로 형변환 할 수 있는 `CharacterSet(CharacterIn:)` 메서드를 이용해 원하는 코들르 작성할 수 있었습니다.
    
**4-1 첫번째 방법으로 +, - , ÷ , x 기호를 직접 넣어줬습니다**
 <details>
 <summary> [details] </summary>

```swift
//input은 메서드에서 매개변수로 받는 문자열 입니다
input.components(separatedBy: ["+", "-", "/", "*"])
```
처음엔 아주 직관적인 방법으로 기호 그대로 넣어줬습니다.
하지만 이 기호들은 Opertor열거형에서 rawValue값으로 이미 갖고있었기 때문에 그것을 이용한 코드로 바꾸고 싶었습니다.
    </details>    

**4-2 두번째 방법은 allcases와 map을 이용해 Array<String>과, Set<Character> 타입을 넣어봤습니다. (오류❌)**
<details>
 <summary> [details] </summary> 

대괄호에 스트링이 들어간 형식이여서 allcased와 map을 이용해  Array[String]으로 넣어봤습니다.
```swift
let operators = Operator.allCases.map{ $0.rawValue }
input.components(separatedBy: operators)
```
❌ 오류 <img height = 35, src = "https://i.imgur.com/fxAihRZ.png">

대괄호에 넣어주길래 단순히 배열로 넣어주는 줄 알았지만 공식문서를 보니 `[CharacterSet]`을 받는다고 했습니다. 


CharacterSet을 Character로 이뤄진 Set인 줄 알고 Setdmfh 형변환해서 넣어줬습니다.
```swift
let operators = Set(Operator.allCases.map{ $0.rawValue })
input.components(separatedBy: operators)
```
❌ 오류 <img height = 35, src = "https://i.imgur.com/eVZCQ1n.png">
set으로 받는다는 줄 알고 Set()으로 형변환을 해줘봤습니다. CharacterSet이 Set과 같지 않다는 것을 알고 CharacterSet을 공부하게 됐습니다..
    </details>

**4-3 세번째 성공한 방법은 `CharacterSet(CharacterIn:)`을 이용해 CharacterSet으로 형변환 한 기호들을 한번에 담을 수 있었습니다.**
    <details>
 <summary> [details] </summary>
        
`CharacterSet(CharacterIn:)`을 이용해 CharacterSet으로 형변환 해주었습니다.
    이 때, String을 이용해야해서 `allcases`와 `map`을 이용해 배열타입으로 만들어 준 뒤, `.joind`를 이용해 다시 문자열로 형변환 후 `CharacterSet(CharacterIn:)`으로 Character타입으로 사용할 수 있었습니다.
```swift
let operators = CharacterSet(charactersIn: Operator.allCases.map{ String($0.rawValue) }.joined())
input.components(separatedBy: operators)
```
</details>

### 5️⃣ ScrollView Scroll 기본값으로 제일 하단으로 지정해 놓는 방법

`setContentOffset` 을 이용해 CGPoint의 y축을 (contentSize의 높이 - bounds의 높이)로 설정해 주어도 scrollView 제일 하단 한 줄 빼고 스크롤이 되는 문제가 있었습니다. 하단 영상처럼 +7 이후부터는 제일 스택뷰의 한 줄이 화면에 보이지 않는 문제였습니다. 스크롤을 내려주는 메서드를 호출해줘도 맨 마지막 줄 빼고 그 위까지만 스크롤 되는 문제였습니다.

<img width = 200, src ="https://i.imgur.com/DE8huir.gif">

결론적으론 View의 drawing cycle을 공부해 `layoutIfNeeded()` 메서드를 호출해 주는 방식으로 문제를 해결했습니다.

<details>
 <summary> [해결과정 details] </summary>
        
- 5-1 오토레이아웃의 문제인가? </br>
    처음엔 **오토레이아웃의 문제**인가 싶어 오토레이아웃도 뜯어살펴보았지만 문제를 찾지 못했습니다.

- 5-2. 내려가지 않는 한 줄만큼 setContentOffsetd의 y축 값으로 추가 </br>
    setContentOffsetd의 y축 값을 더 내려가도록 해주면 될까 싶어서 **offSet변화량을 콘솔로 확인해서 변화량인 24큼 더 내리도록 해보았습니다** ( y = contentSize의 높이 - bounds의 높이 + **24** ) 

    이렇게 할 때는 `컨텐츠높이`가 `bounds높이`보다 커질 때를 기준으로 첫번째 입력(아래GIF에서 +7때)에서 마지막줄이 안 보이고, 두번째 입력시(+8떄) 이전에 찍은 +7값과 같이 두개값이 동시에 나온 후에 세번째부터는 정상작동하는 문제가 있습니다. </br>
   
    <img width = 200, src ="https://i.imgur.com/PNj4xWk.gif">
    
- 5-3. 시간적인 duration 관련 문제인가? </br>
    업데이트 후 스클롤링 함수를 호출하는 시간 사이에 delay가 생길까 싶어 **notification Center**사용으로 한박자 늦게 scroll을 내리는 함수를 호출해보기도 했지만 무용지물이었습니다..
    
- 5-4. ✅ 드로잉 사이클 (drawing cycle)을 공부 </br>
    컨텐츠가 변하여도 다음 드로잉사이클까지 **대기 후**에 다시 view가 업데이트 되는것을 알았습니다.
    
    setNeedsDisplay 메서드를 사용하면 시스템에게 draw 메서드를 호출하도록 요청해서 다시 View를 그려주게되는데 이 과정이 바로 즉각 되는것이 아니라 다음 drawing cycle까지 기다렸다가 진행됩니다. 제 화면에서 생각해보면 내부에서 스크롤하는 함수가 호출되어 스크롤을 제일 아래로 내렸지만, 하단에 스택뷰가 추가된 완성된 레이아웃 재배치는 그 후에 이뤄지는 사이클이었기 때문에 마지막 줄이 안보이는 문제가 생겼던 것입니다.
    
    setNeedsDisplay와 같은 기능을 하지만 layoutIfNeeded메서드는 다음 드로잉 사이클까지 기다리지 않고 즉시 view layout을 업데이트 해줄 수 있는 메서드입니다. 때문에 layoutIfNeeded메서드를 호출한 후 스크롤을 내려주어 문제를 해결했습니다. 

    setNeedsDisplay 메서드의 호출 여부에 따른 실제 offset 수치를 확인해 보았습니다. 
    아래의 표는 스크롤뷰에 추가된 스택뷰의 갯수에 따른 컨텐츠높이, bound높이, content offset의 y축값 을 정리한 것입니다.
    표에서 확인이 가능한 것은 layoutIfNeeded를 호출하지 않고 계산기를 찍을때와 호출했을 때의 값이 한스텝씩 차이가 난다는 것입니다. 

    <img width = 800, src ="https://i.imgur.com/oDgorTU.png"> </br>
    (위 표에서 offSet을 빨간글씨는 스크롤 제일 아랫줄이 보이지 않을때를 표시한 것입니다.)

    이 스텝의 차이는 위에서 설명했듯이 순서의 차이입니다. `스크롤내리기 -> 뷰 업데이트` 와 `뷰 업데이트 -> 스크롤내리기` 의 차이입니다.

    </details>   
    
    
    ---

## 7. 🔗 참고 링크
- [[공식문서] Swift Language Guide - Extentions
](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
- [[공식문서]Swift Language Guide - Protocols
](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [[공식문서]Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [[공식문서]ios developer - UIView](https://developer.apple.com/documentation/uikit/uiview) 
- [[공식문서]ios developer - NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)     
- [야곰닷넷 - 오토레이아웃 정복하기](https://yagom.net/courses/autolayout/)        
- [개발자 소들이-Swift) 큐(Queue) 구현 해보기](https://babbab2.tistory.com/84)
- [개발자 소들이-Swift) 단방향 연결 리스트(LinkedList) 구현 해보기](https://babbab2.tistory.com/86)
- [iOS ) View/레이아웃 업데이트 관련 메소드](https://zeddios.tistory.com/359)
