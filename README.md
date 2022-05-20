## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

# [Step 01] 

# 공부한 내용
> UML, LinkedList, DoublyLinkedList, Array, Queue, Protocol, 
> Unit Test, TDD
### UML
![Calculator drawio (1)](https://user-images.githubusercontent.com/59466342/168809563-525214ba-d4a1-4607-bd9e-ec41b20b5185.png)


### LinkedList || Array || DoublyLinkedList
- Array 
    - 한 메모리 공간 안에 데이터들이 "나란히" 저장되어있다
    - 마지막 index가 아닌 element를 삭제하거나 삽입할 경우,
    - 이런 식으로 element를 재배치하는 작업 때문에
    - 오버헤드가 발생하는 단점이 있다.
- LinkedList 
    - 각각 떨어진 공간에 존재하는 데이터를 연결해 놓은 것임
    - 삽입, 삭제 시 재배치에 발생하는 오버헤드도 발생하지 않음 (vs array)
    - 매번 순차적으로 탐색 해야함
    
- DoublyLinkedList 
    - LinkedList는 노드를 삽입하거나 삭제할 경우 매번 순차적으로 찾아야 하는데 head, tail값으로 그부분을 보완할 수 있다.

### Queue
> FIFO (First-In First-Out)으로 먼저 들어간 데이터가 먼저 나오도록 하는 자료구조입니다. 

> enqueue를 통해 데이터를 쌓습니다.
> dequeue 일시 처음 들어온 데이터가 제거될 수 있도록 하였습니다. 
> peek을 통해 first 값을 찾을 수 있습니다.
> isEmpty를 통해 Queue의 데이터가 비어있는지 확인합니다. 
> removeAll을 통해 모든 데이터를 제거합니다.

### Protocol
> Protocol을 통해 Queue의 기능을 추상화 하였습니다. 

### Unit Test
> Node, DoublyLinkedList, CalculateItemQueue 각각의 기능들을 
> 유닛테스트 하였습니다.

### TDD
> 처음에 Node클래스를 구현 하기 위해서 최소한의 단위에 대해서 고민해 보았으나 그 후에 진행 되야할 부분들은 어떻게 하는게 좋을지 잘 생각이 나질 않아 끝까지 진행하지 못하였습니다. 
