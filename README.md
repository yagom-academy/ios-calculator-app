## iOS 커리어 스타터 캠프

### 계산기 프로젝트
# STEP1 
---
## 학습내용 
- Queue
  - FIFO(First In First Out) 방식
  - 줄을 선 순서대로 나가는 형태를 띄는 자료구조
  - 파이프의 입구에서 삽입이 이루어지면 반대 출구에서 삭제가 이루어짐
- Stack
  - LIFO(Last In First Out) 방식
  - 쌓아 올린 형태를 띄는 자료구조
  - 삽입, 삭제의 경우 가장위에, 즉 top에서 이루어짐
- 배열(Array)
  - 장점
    - 크기가정해져있다, 순차적이다
    - 덕분에 index를 통해 값에 대한 접근이 빠름 
  - 단점
    - 마지막 index가 아닌 element를 삭제 하거나 삽입할 경우 element를 재배치 하는 작업이 발생 -> 오버헤드 발생 
    - 배열이 찼을 때 새로운걸 추가해야 할 때면 배열의 크기가 두배로 증가 2 -> 4 -> 8
- 연결리스트(Linked List)
  - 장점
    - 원하는 때에 메모리에 공간을 할당
    - 중간 element를 삽입, 삭제 시 재배치에 발생하는 오버헤드 발생x
  - 단점
    - 데이터를 찾으려면 head부터 순회해야함 ->  접근속도가 느림(양방향 연결리스트가 이 부분을 보완)
    - 연결 정보를 저장하는 별도의 데이터 공간이 필요 저장 공간의 효율이 좋지 않음
- 더블스택(Double Stack)
  - 장점
    - dequeue시 재배치 하는 과정이 없어 시간 복잡도 개선
    - Stack은 순차적이기 때문에 연결리스트의 단점인 공간 복잡성 개선    
---
## UML
<img src="https://user-images.githubusercontent.com/94295586/160146394-013e22e1-7329-495f-ad51-9d334e6d6cc5.png" width="600" height="600"/>

---
## 고민했던점
## 1. Queue를 구현할 때 셋(Array, Linked List, Double Stack) 중 고민
> - 더블스택이 가장 효율적이라고 생각했습니다. 실제로도 한 블로그에서 3개의 경우를 속도 테스트 한 결과를 봤는데 더블스택이 효율이 압도적으로 좋았습니다
> - 처음에는 양방향 연결리스트를 생각했지만 계산기 동작에서는 중간중간 삽입 삭제의 기능이 필요 없다고 판단되어 제외했습니다.
---
# STEP 2
---
## 학습내용
- 함수형 프로그래밍
- 고차함수
- [고차함수, 함수형프로그래밍](https://velog.io/@strangeman/%EA%B3%A0%EC%B0%A8%ED%95%A8%EC%88%98map-filter-reduce)
---
## UML
<img src="https://user-images.githubusercontent.com/94295586/159646920-f8833300-9c70-4154-9ab9-dddc2fa2781c.png" width="1000" height="600"/>

---
## 고민했던점
## 1. 0으로 나누기를 시도하는 경우 적절한 오류처리
- 명세서에 "0으로 나누기에 대해서는 결과값을 `NaN`으로 표기합니다"를 보았습니다
- 0으로 나누었을 때 `nan`을 리턴해주어 이것을 이용하여 예외처리 해주면 좋겠다는 판단이 들었습니다
## 2. Extension String의 용도
- UML을 보면서 계속 고민해 봤는데 혼자서 용도를 파악하지 못 했습니다
- 5기 캠퍼의 도움을 받아 `split`의 용도가 `String`의 공백을 기준으로 분리 해주기 위한 용도라고 이해하였습니다
- 의도와 맞는지는 확신할 수는 없었지만 이것 외에 다른 경우의 수가 떠오르지 않았습니다 ㅠ 
## 3. componentsByOperators에 의도
- 함수명을 봤을 때 이 함수에서 연산자에 의해 분리가 되고 그 분리된 값을 리턴해줘야 할 것 같다고 생각했습니다 
- 그런데 함수의 리턴값은 `[String]`하나여서 이거에 맞게 연산자와 피연산자를 리턴해주는 방법을 생각하지 못했습니다 
- `parse`함수의 리턴타입이 `Formula`인것을 보고 `componentsByOperators`에서 리턴받은 `[String]`을 `parse`에서 연산자와 피연산자를 분리해서 `Operands큐` 와 `Operators큐`에 인큐해줘야 한다고 판단했습니다
## 4. CaseIterable 활용
- 2번 째 고민을 해결하는 과정에서 도와주신 캠퍼분이 많은 캠퍼분들이 `CaseIterable`를 놓치고 있는데 아직 `ExpressionParser`를 작성 안하셨다면 "활용해서 해결해 보세요" 힌트를 주셨습니다
- `CaseIterable`를 활용해서 `componentsByOperators`에서 리턴받은 `[String]`을 분리 해주는 과정에서  리턴타입`Operator`를 맞춰 주는 부분에서 쓰고 지웠다를 많이 반복한 것 같습니다
## 5. Fomula에서 dequeue하는 과정
- 큐에서 `dequeue`를 반복적으로 해주는 조건을 고민하였습니다
- 제가 떠오른 반복조건은 `!(operands.isEmpty && operators.isEmpty)`였습니다
