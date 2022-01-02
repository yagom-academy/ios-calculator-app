# 계산기 프로젝트

## 프로젝트 소개
1. 사용자는 숫자 및 연산자 버튼을 탭하여 원하는 연산을 입력하고, 연산 결과를 확인한다.
1. 연산 버튼의 기능은 일반적인 계산기와 동일하며 아래와 같이 작동한다.
   - AC (All Clear) 버튼 : 전체 연산 내역을 삭제한다.
   - CE (Clear Entry) 버튼 : 최근 입력한 숫자 또는 연산 결과를 삭제한다.
   - +/- 버튼 : 입력 중인 숫자의 부호를 변경한다.
   - = 버튼 : 연산 결과를 확인한다.
1. 숫자 입력 중에 연산자를 입력하면 숫자 입력을 중지하고 다음 숫자를 입력받는다.
1. 이 프로젝트에서 연산자 우선순위를 무시한다. (ex. + 연산보다 * 연산을 먼저 수행해야 하지만 이 프로젝트에서는 무시한다.)
1. 상단에 연산 내역을 표시하고, 내역이 길어지면 사용자가 Scroll하여 확인할 수 있게 한다.
1. 예외 처리는 아래와 같이 진행한다.
   - 숫자 및 연산자를 입력 후 다시 연산자를 입력할 경우 마지막에 입력한 연산자로 연산을 수행한다.
   - 입력된 숫자가 0인 경우 +/- 버튼을 눌러도 부호를 표시하거나 변경하지 않는다.
   - = 버튼을 탭하여 연산이 종료된 경우 다시 =를 탭해도 재연산하지 않는다.
   - . 버튼을 탭하여 소수가 된 경우 다시 . 버튼을 탭해도 소수점을 붙이지 않는다.
   - 입력된 숫자가 0인 경우 . 버튼을 탭하면 자동으로 0.* 형태의 소수로 처리한다.
   - 0으로 나누기를 하는 경우 연산 결과로 "NaN (숫자 아님)"을 표시한다.

![general_Simulator Screen Recording - iPhone 12 - 2021-11-23 at 09 20 43](https://user-images.githubusercontent.com/70856586/147676122-733cd81f-cccd-44f6-9bfc-38c00e220db0.gif)
![연산자직후=탭 케이스 추가ExceptionHandling_Simulator Screen Recording - iPhone 12 - 2021-11-23 at 09 43 26](https://user-images.githubusercontent.com/70856586/147676090-6c498e9e-90b9-4753-bdd4-a5637069d14f.gif)

### 프로젝트 참여자
   - 팀원 : 애플사이다 @just1103 (개인 프로젝트)
   - 리뷰어 : 찌루루 @jae57

### 프로젝트 일정
* STEP1 (1주차)
   - 11/08 (월) 프로젝트 확인, Linked List/Queue 구현
   - 11/09 (화) UML 작성, README 작성 및 PR 요청
   - 11/10 (수) STEP1 개선
* STEP2 (1~2주차)
   - 11/11 (목) 사전 공부, UML 분석, Operator Enum/String Extension 구현
   - 11/12 (금) ExpressionParser Enum 구현
   - 11/14 (일) 사전 공부, ExpressionParser Enum 개선
   - 11/15 (월) Formula Struct 구현, 오류 처리, README 작성 및 PR 요청
   - 11/16 (화) STEP2 개선
* STEP3 (2주차)
   - 11/17 (수) 사전 공부
   - 11/18 (목) 계산기 버튼 ACtion 함수 구현
   - 11/19 (금) NumberFormatter를 통해 숫자 표시방식 설정
   - 11/20 (토) 커스텀 Label 및 StackView 구현
   - 11/21 (일) ScrollView에 Dynamic StackView 추가, 하단으로 자동 Scroll, README 작성 및 PR 요청

## STEP1
### 구현 내용
- 사용자가 계산기에 입력한 숫자 및 연산자를 Queue (CalculatorItemQueue 클래스)에 차례로 저장한다.
- Queue를 구현하기 위해 Linked List를 활용했다.
- TDD 방식으로 프로그래밍을 진행했다. XCTest를 통해 Test Case를 작성하여 테스트를 실행했다.

### UML
![image](https://user-images.githubusercontent.com/70856586/141853112-7f49d618-7d68-415b-aa86-b94b6f6bcc11.png)

### 고려사항
* 기능
   - Queue를 사용하는 이유 : 계산기 프로그램에는 맨 앞과 맨 뒤를 삭제/추가하는 기능이 필요하며, 임의의 값을 탐색하지 않으므로 Queue가 적절하다.
   - Queue를 구현할 때 Array보다 Linked List가 적합한 이유 : Array의 removeFirst 메서드는 메모리 상에서 삭제한 요소 뒤에 위치한 요소들의 index를 모두 변경해야 하므로 성능이 낮다. (시간복잡도 O(n)) 반면 Linked List는 다음 요소를 가리키고 있는 포인터만 변경해주면 되므로 메모리 관리에 유리하다. (시간복잡도 O(1))
   - 계산기 프로그램에서 Queue에 저장할 숫자 및 연산자의 타입이 다르므로 (숫자는 Double 타입, 연산자는 함수 타입) 제네릭을 사용했다.

* 주요 프로퍼티 
   - head : Linked List의 첫 번째 노드를 가리킨다.
   - tail : Linked List의 마지막 노드를 가리킨다. (메서드 로직에서 마지막 노드를 찾는 경우가 빈번하므로 코드 중복을 방지하고자 생성했다.)
   - isEmpty : head가 있는지, 없는지 여부를 나타낸다.

* 주요 메서드
   - append : Linked List의 마지막에 새로운 노드를 추가한다.
   - removeFirst : Linked List의 첫 번째 노드 (head)를 제거 및 반환한다. (Queue에서 꺼낸 숫자 및 연산자를 사용하기 위해 반환타입을 지정했다.)
   - scanAllValue : 계산기 프로그램 작동에 직접 사용되지는 않지만, 테스트 코드에서 사용하기 위해 추가했다. 

* Test Case (LinkedList)
   - head/tail/isEmpty 프로퍼티 정상 반환 여부
   - append/removeFirst/scanAllValue/removeAll 메서드 정상 작동 및 반환 여부
* Test Case (CalculatorItemQueue)
   - enqueue/dequeue/scanAllValues/allClear 메서드 정상 작동 및 반환 여부

### 키워드
- TDD (Unit Test, XCTest), Data Structure (Queue/Linked List), Time Complexity, Generic, Inheritance, UML

## STEP2
### 구현 내용
- 사용자가 계산기에 입력한 숫자 및 연산자를 1개의 문자열로 받아 처리한다. 
- 프로젝트 요구사항으로 지정된 UML에 따라 타입을 구현한다. 
- 문자열을 처리하여 숫자 및 연산자를 각각의 Queue에 할당한다. 제네릭 타입 매개변수를 각각 Double/Operator 타입으로 지정하여 별도의 Queue 인스턴스를 생성했다.
- Queue의 숫자/연산자를 차례로 꺼내어 사칙연산을 처리한다. (이번 프로젝트에서 연산자 우선순위는 무시한다.)

### UML
![image](https://user-images.githubusercontent.com/70856586/141853001-fb1b7991-cea1-44f6-9413-da746e641ee7.png)

### 고려사항
* 기능
   - 숫자 및 연산자로 구성된 문자열 처리를 위해 Extension, Protocol을 활용했다.
   - 연산이 불가능한 경우 (ex. 0으로 나누기) 오류 처리를 했다.
   - 빈 Queue를 dequeue하는 경우 nil이 반환되므로 연산을 중지하도록 오류 처리를 했다.

* 주요 타입 및 메서드
   - Operator 열거형의 calculate : 연산자 (Operator case)에 따라 연산을 실행한다.
   - String Extenstion의 split : Character 타입을 전달인자로 받아 문자열을 분해하여 배열로 반환한다.
   - ExpressionParser의 componentsByOperators : 문자열을 연산기호 (Operator case의 원시값, Character 타입)로 분해하여 배열로 반환한다.
   - ExpressionParser의 parse : 문자열의 숫자 및 연산자를 구분하여 각각의 Queue에 할당하고, 해당 Queue를 프로퍼티로 갖는 Formula를 반환한다.
   - Formula의 result : Queue의 숫자/연산자를 차례로 꺼내어 사칙연산을 수행하고, 결과값을 반환한다. 

* Test Case (ExtensionsTests/OperatorTests/ExpressionParserTests)
   - 메서드의 정상 작동 및 반환 여부
* Test Case (FormulaTests)
   - 메서드의 정상 작동 및 반환 여부
   - 오류 처리 정상 작동 여부

### 키워드
- Higher-order function, String Manipulation, Protocol, Closure, Extension, Error Handling

## STEP3
### 구현 내용
- 사용자의 터치 이벤트를 처리하여 연산을 수행한다.
- StackView 및 Label을 활용하여 ScrollView에 연산 내역을 표시한다.
- 계산 내역이 길어지면, 사용자가 가장 최근의 연산 내역을 확인할 수 있도록 최하단으로 자동 Scroll 한다. 
- 소수점 자리는 최대 20자리까지 표시하고, 숫자는 1000 단위 마다 comma(,)를 표시한다.

### 고려사항
* 기능
   - `숫자1-연산자1-숫자2` 순으로 버튼을 탭하는 경우 `숫자2`를 탭하는 시점에 completeFormula 및 StackView에 입력한 연산 내역을 반영한다.
   - = 버튼을 탭하면 completeFormula에 저장된 숫자/연산자를 활용하여 연산을 실행한다.
   - 커스텀 StackView/Label을 만들기 위해 UIStackView/UILabel을 상속받은 클래스를 구현했다.
   - NumberFormatter를 활용하여 최대 소수점 자리 및 숫자 표시 스타일 등을 설정했다.

* 주요 타입
   - ProcessLabel/ProcessHorizontalStackView 클래스 : 커스텀 UI 요소를 생성하기 위해 클래스 상속을 사용하여 구현했다.

* 주요 프로퍼티
   - currentOperand/currentOperator (String 타입) : 사용자로부터 최근 입력받은 숫자/연산자를 임시로 저장한다. ScrollView의 레이블에 반영하여 연산 내역을 표시한다. 
   - completeFormula (String 타입) : 연산을 수행할 숫자/연산자를 저장한다. 사용자가 = 버튼을 탭하면 숫자/연산자를 분리하여 Formula 타입의 숫자/연산자 Queue에 각각 저장하고, result 메서드를 통해 연산을 수행한다.
   - isLastOperator (Bool 타입) : 숫자 및 연산자를 입력 후 다시 연산자를 입력할 경우 마지막에 입력한 연산자로 연산을 수행하기 위해 마지막 입력값이 연산자인지 여부를 저장한다.

* 주요 메서드
   - changeNumberFormat : NumberFormatter를 활용하여 최대 소수점 자리 및 숫자 표시 스타일 등을 설정한다.
   - refreshLabelsWithResult : 연산을 수행하고 연산 결과를 레이블에 반영한다.
   - addCalculationProcessWithHorizontalStackView : ScrollView 내부의 Horizontal StackView의 Label에 연산 내역을 표시한다.
   - scrollToBottom : setContentOffset 메서드를 사용하여 특정 위치로 자동으로 Scroll 되도록 한다.
   - touchUpOperandBtn : 사용자가 입력한 숫자 정보를 받아 formula 및 레이블에 반영한다.
   - touchUpOperatorBtn : 사용자가 입력한 연산자 정보를 받아 레이블에 반영한다.

### 문제점 및 해결방법
1. UIButton (숫자/연산자 버튼)에 일일이 해당하는 숫자/연산자를 지정하는 것이 번거롭고 비효율적이라서 UIButton의 텍스트 정보를 받아오도록 구현하기 위해 고민했다. 
   - 해결방법 : `btn.titleLable.text`를 통해 UIButton의 텍스트 정보를 String으로 받아 사용할 수 있었다.  
1. `숫자1-연산자1-숫자2-연산자2` 형태의 입력뿐만 아니라 `숫자1-연산자1-연산자2` 형태의 입력을 처리해야 했다. 이 경우 `연산자1`을 무시하고 `연산자2`를 반영해야 했다. 
   - 초기에는 `숫자1-연산자1`을 completeFormula에 반영하고 `연산자2`가 입력되면 completeFormula에서 `연산자1`을 삭제하는 방식으로 작성했으나 비효율적이라는 판단이 되어 다른 방법을 고민했다.
   - 해결방법 : `숫자1-연산자1-연산자2-숫자2` 형태에서 `숫자2`를 입력받는 시점에 completeFormula에 `연산자1-연산자2` 정보가 반영되도록 처리했다.
   - 하지만 이 때문에 `숫자1-연산자1-연산자2-숫자2`가 입력된 시점에서 = 버튼을 탭할 경우, formula 및 ScrollView의 레이블에 `숫자2`가 표시되지 않는 문제가 발생했다. 따라서 = 버튼의 Action 함수에서 `숫자2`를 반영하도록 수정하였으나, 하드 코딩이므로 향후 유지보수에 부정적인 영향을 줄 수 있다고 판단되어 개선이 필요하다.
1. ScrollView에서 표시할 연산자 레이블 및 숫자 레이블에 동일한 UI 효과를 지정하였는데 코드가 중복되어 개선하고자 했다.
   - 해결방법 : UILabel을 상속한 별도의 ProcessLabel 클래스를 생성하여 UI를 커스텀했다.
1. ScrollView에서 표시할 Horizontal StackView에 항상 2개의 숫자/연산자 레이블을 추가하도록 설정하고자 했다.
   - 해결방법 : 위와 같이 UIStackView를 커스텀하는 클래스를 생성하고, 이니셜라이저의 매개변수로 2개 레이블을 전달하도록 했다.
1. Horizontal StackView를 Vertical StackView에 addSubview 했는데, Horizontal StackView의 위치가 좌측 상단에 고정되는 문제가 발생했다.
   - 해결방법 : addSubview 메서드를 addArrangedSubview 메서드로 대체했다. 
1. 연산 내역이 ScrollView 영역보다 길어지면, 새로 입력한 연산 내역이 가려져 보이지 않았다.
   - ScrollView의 setContentOffset 함수를 사용하여 자동으로 최하단으로 Scroll 되도록 했다.
1. 예외 처리를 누락한 부분이 있다. `숫자1-연산자1-숫자 ".3"`을 입력하면 `0.3` 대신 `3`으로 formula에 반영되는 문제가 발생했으나 아직 해결하지 못했다.

### 키워드
- StackView, ScrollView, customizing UI Elements, ArrangedSubview, NumberFormatter, Decimal, Exception Handling
