## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

# Step1 

## UML
![](https://i.imgur.com/WBmKFA1.png)
## TDD
- TDD 를 이용하여 단위테스트를 진행하며 최소한의 코드를 추가했다. 
- 기능명세서의 역할을 한다.
## Queue
- 사용자에게 받은 입력값(숫자, 연산자)들을 쌓아놓기 위한 Qeueu를 구현했다. 
- Queue의 종류
    - **배열**
        - FIFO 특성을 가진다. 
        - 스위프트의 배열에서는 먼저 2배씩 늘려놓는다. 
        - 빈 공간에 enQueue()를 수행할 때는 수행속도가 O(1) 로 빠르다
        - 하지만 크기를 늘려야 하는 시점에서는 수행속도가 O(n)이다
        - deQueue() 수행 시, 빠진 배열을 매꿔주어야 해서 수행속도가 O(n) 
    - **연결리스트**
        - 자기자신의 노드와 다음노드를 가리키는 참조정보로 구성된다. 
        - 더블연결리스트의 경우는 여기에 이전노드를 가리키는 참조정보가 추가된다.
        - enQueue() 수행속도는 O(1)이 된다.
        - deQueue() 수행시 배열처럼 재정렬이 필요한 것이 아니므로 수행속도가 O(1)
        - 값, 이전노드참조, 다음노드참조 등을 포함하는 동적할당 때문이 상대적으로 큰 메모리 소모
        - 메모리 접근 시간이 느리다
    - **stack**
        - 배열로 append와 popLast 를 이용하면 stack처럼 사용 가능하다.
        - 나아가, 더블stack이란 FIFO를 구현하고자 할 때 배열에서 생기는 재정렬의 문제를 해결하고자 고안된 방법이다
        - Dequeue 전용 스택과 Enqueu 전용 스택을 만들어서, Enqueue에서 Dequeue로 넘겨줄 땐 reversed()로 반전시켜 넘겨주고 popLast를 하면, 배열의 첫번째 값을 얻고도 재정렬이 필요하지 않게 된다. 
        - 공간복잡도 측면에서도 더블연결리스트 보다 수행이 빠르다. 
        
- 본 프로젝트에서는 **FIFO**방식이 필요하고, 큐 중간에 삽입하거나 삭제하는 과정은 필요하지 않기 때문에, 처음엔 배열을 선택하게 되었는데, deQueue() 수행 시 이루어지는 재정렬 문제를 해결하기 위해 더블stack으로 바꾸어 주었다.

# STEP2

## UML Diagram
![](https://i.imgur.com/xfjdHte.png)

## 구현사항
- **CalculatorItemQueue**
    - Fomula 에서 사용되기 위해 `count` 읽기전용 연산프로퍼티와 `init()` 구문을 추가 해주었다.
- **Fomula**
    - Fomula = 공식 이라는 해석이 되었다. 이 공식이라는 구조체 안에서 연산자 큐 ( oprators ) 와 피연산자 큐 ( operands ) 안의 값들을 이용하여 result 라는 함수에서 전체 계산을 하도록 구현 해주었다.
- **ExpressionParser**
    - string으로 들어온 값을 분리하여 연산자큐 와 피연산자큐 에 나눠 담아주는 작업이 이루어 졌다.
- **Operator**
    - 각 케이스 별로 이루어지는 계산로직을 다르게 실행해줄 수 있도록 `switch - case` 를 이용했다.
- **Extension Double**
    - 이 부분의 역할을 파악하지 못했다.
- **Extension String**
    - 기존의 split 함수는 ``[SubString]`` 을 반환하지만, ``[String]`` 을 반환할 수 있도록 새롭게 만들어 주었다.

## 고민한 점 & 궁금한 점
- force unwrapping
   확실한 경우에 ! 를 사용하는 점에 대해서 고민
- enum 타입의 테스트
    - expressionParser enum 에 대한 테스트를 진행할 때, 초기화구문이 없어 각 테스트케이스 마다의 초기화와 메모리 해제를 해줄 수 없어 어떻게 테스트할지 고민했다. 
        static으로 타입메서드로 만들어 주니 test에서 사용할 수 있었다. 
- 테스트만을 위한 코드
    - 함수를 구현하다 보니, "CalculatorItemQueue" 에서 currenStack 이라는 프로퍼티와 enqueue() 함수는 테스트 코드에서만 사용된다는 것을 깨달았다. 


# STEP3

## UML Diagram

![](https://i.imgur.com/t5KwBzo.png)

## 구현사항
- 기존의 "String+Extensions" 에 문자열에서 특정 Character 를 모두 지워주는 함수를 추가 했다.
```swift=
    removeEntire(character: Character) -> String
```  
- 화면의 모든 UI를 연결 해주었다. 
- `NumberFormatter`를 이용하여 숫자의 소숫점 제한과, 세자리 마다 쉼표 설정을 추가했다
- 각 연산자 버튼에 대한 계산을 수행하도록 구현했다 
    - "+","-","×","÷"
        - 버튼 터치시, 입력하던 숫자를 스택으로 올리고 다음 숫자를 받을 수 있도록 구현했다.
        - 만약 현재 `screenLabel`이 0이라면 부호만 바뀌도록 구현했다.
    - "="
        - 버튼 터치시, 스택에 쌓여있는 숫자들을 읽어와 `ExpressionParser()`에 넣어줬다.
        - 계산 결과값이 `screenLabel`에 표시되도록 했다. 
        - 만약 현재 `screenLabel`이 "0" 이거나 "결과값"이어서 `currentOperatorLabel` 이 비어있다면 return 하도록 구현했다.
- 기능버튼("AC","CE","+/-") 에 대한 수행을 구현했다.
    - "AC"
        - `historyStackView` 에 쌓여있는 스택들을 `removeAllIn()`함수를 이용해 모두 제거 해주었다.
    - "CE"
        - 현재 `screenLabel` 에 올려져 있는 text를 0으로 변경 해주었다.
    - "+/-"
        - 현재 `screenLabel` 에 올려져 있는 text에 -1을 곱해주었다
        - 현재값이 0이라면 수행되지 않도록 구현했다.
- historyStackView
    - `goToBottomOfScrollView()`
        - 스택이 추가될 때 마다 최하단으로 자동 스크롤 되도록 구현했다.

## 수행 중 버그 기록
- 빼기 연산 오류
    - 스토리보드상 "-" 버튼과 `Operator` 에 subtract 케이스의 rawValue "-" 와 서로 다른 문자였다.. 
- "=" 버튼 터치 이후 결과값으로 새로운 계산수행 불가
    - `generateTextData()` 로직에서 기존에는 `historyStackView` 의 모든 값을 읽어오는 역할을 했어서 이전 값들과의 결합상의 오류가 있었는데, 값을 읽어오기 시작하는 index를 설정하기 위해 `calculateStackCount` 라는 프로퍼티를 만들어 이전에 계산했던 스택들의 개수를 세어 그 다음 계산에서는 이후부터 계산하도록 구현했다.
- 스토리보드에 기본으로 존재하는 Stack
    - scrollView 안에 존재하는 stack을 제거하니 constraint 오류가 발생, 이를 스토리보드 상에서 제거할 수 없으므로 코드로 viewDidLoad에서 제거 해주었다. 
    - 이유는 위의 연속적인 계산을 위한 index설정을 해주었는데, 이 기본 스택 때문에 생길 오류를 방지하기 위해서이다
    - numberFormatter를 이용해 세자리마다 쉼표 표시를 하니, 스택에서 숫자값을 읽어오는 로직에서 오류가 발생, 쉼표가 포함되어 있어 Double로 형변환이 되지 않았다. 또한 기능버튼 "+/-" 에서도 Double로 형변환에 오류를 뿜었다. 이를 해결하기 위해 "String+Extensions" 에서 `removeEntire()` 를 하나 만들어주어 문자열에서 특정문자를 모두 제거해주는 로직을 작성했다. 

## 구현 화면

----< **간단한 사칙연산** >--------------<**긴 사칙연산**>-------------<**쉼표와 소수점 처리**>  

<img src="https://i.imgur.com/hug9Vkw.gif" width="200" height="400"/><img src="https://i.imgur.com/xBp50Dd.png" width="25" height="400"/><img src="https://i.imgur.com/tbweDEl.gif" width="200" height="400"/><img src="https://i.imgur.com/xBp50Dd.png" width="25" height="400"/><img src="https://i.imgur.com/7gkHoq4.gif" width="200" height="400"/>  
  
    
    
# 

---< **기능버튼 "CE", "+/-"** >-------<**오류처리 NaN**>-------------<**계산내역 스크롤**>

<img src="https://i.imgur.com/c7G71QF.gif" width="200" height="400"/><img src="https://i.imgur.com/xBp50Dd.png" width="25" height="400"/><img src="https://i.imgur.com/JirfoPe.gif" width="200" height="400"/><img src="https://i.imgur.com/xBp50Dd.png" width="25" height="400"/><img src="https://i.imgur.com/iXxQRBa.gif" width="200" height="400"/>


## 고민한 점 & 궁금한 점


