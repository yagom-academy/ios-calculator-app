## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

## STEP1 UML
![스크린샷 2022-03-16 오후 10 34 10](https://user-images.githubusercontent.com/52434820/158611746-5c75433f-2c68-4b9e-9768-3c0420c4e8ec.png)



## 주요 함수
`CalculatorDoublyLinkedList` : 양방향 연결리스트 활용하여 노드를 넣고, 빼고, 수를 세는 클래스
`QueueLinkedList` : 데이터르 저장하는 방식으로 Queue를 이용하여 양뱡형연결리스트로 데이터를 보내는 클래스
`Node` : 양뱡향연결리스트에 필요한 노드 정보 클래스 
`CalculateItem`: 추후 사용할 프로토콜

## 고민한 점
먼저 Queue를 활용하고 그 내부를 어떤 것을 사용할지 고민했습니다.
배열, 스택 2개, 단방향 연결리스트, 양방향 연결리스트 4가지 방식이 존재한다는 것을 알게 되었습니다.

처음에는 배열로 구현하면 쉽겠구나? 생각했는데 요소를 제거할 때 문제가 있음을 파악했습니다. 제거할 때 하다 요소가 한칸씩 떙겨지기 때문에 오버헤드가 발생하여 효율이 떨어진다는 것을 알게되었습니다.
다음으로 스택을 2개로 구현하는 것인데 배열로 구현한 큐( QueueArray ) 와 비교하면
deQueue() 메소드의 수행속도가 빠르다는 것을 공부하게 되었습니다  ( O(1) > O(n) )
더블 연결리스트로 구현한 큐 ( QueueLinkedList ) 와 비교하면
Space Complexity ( 공간복잡성 ) 측면에서 연결리스트 보다 더 좋다고 하네요!
'더블스택  으로 구현한 큐'( QueueDoubleStack ) 의 공간 복잡성 : 빠름.
하지만 구현하는 것에서 비효율적이라고 판단해서 이를 배제했습니다.

그래서 마지막으로 단방향, 양방향 연결리스트 중에 고민 했는데 우리는 탐색은 필요없고 마지막 입력한 것을 제거하는 것이 필요한 것을 보고 양방향 연결리스트를 하면 좋을 것 같다고 생각해서 구현하게 되었습니다.

그래서 저의 고민은
- 실제 개념과 코드를 보게되니 짜는데에는 무리가 없었습니다. 하지만 교과서를 보고 문제를 푼느낌이라고 할까나, 최대한 안보고 개념만으로 짜려고 했으나 쉽지 않는 부분은 고민 끝에 일부 예제 코드를 보면서 했음에도 찝찝하긴 했습니다. 이런 부분은 다시 짜보며 연습해보며 익숙해지는 것이 맞겠죠?
- Test 코드를 먼저 작성하고 코드를 짜려고 하니 더 어려웠습니다. 먼저 어느 수준에서 테스트코드를 해야할지 감이 안와서 처음에는 enque하나 찾아보고, dequeue하나 해보고 이런식으로 했는데, 어느 단위로 쪼개서 테스트 코드를 작성할지 아직도 감이 오지 않습니다. 
- 자료구조에서 큐와 양방향연결리스트를 사용한 것인데 큐는 유저의 입력을 처리해주는 방식인 것이고, 실제 유저의 입력이 내부적(개발자만 아는)으로 처리는 양방향연결리스트로 생각한 것인데 이런 생각이 맞고, 그에 맞는 코드 작성인건지 궁금합니다.
- CalculateItem 이라는 빈 프로토콜을 작성하라고 했는데, 저는 아직까지도 이 프로토콜이 현재 STEP 1에서 왜 필요한지 의문이 듭니다. 첨에 들었던 생각은 이곳에서 연산이 이루어지면 되겠다 생각했는데, 현재에서는 필요해보이지 않아서 단순하게 채택정도만 했는데 혹시 제가 잘못된 생각을 하고 있는 것인가요?
