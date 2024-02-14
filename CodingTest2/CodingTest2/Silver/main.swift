//
//  1927.swift
//  최소힙
//
//  Created by SeokHyun on 2/14/24.
//

var n = Int(readLine()!)!
var heap = Array(repeating: 0, count: 100_000)
var lastIndex = -1
for _ in 0..<n {
  let x = Int(readLine()!)!
  if x == 0 {
    minHeap()
  } else {
    insertHeap(x)
  }
}

func insertHeap(_ x: Int) {
  lastIndex += 1
  heap[lastIndex] = x
  var currentIndex = lastIndex
  
  while currentIndex > 0, heap[(currentIndex-1)/2] > heap[currentIndex] {
    let parentIndex = (currentIndex-1)/2
    heap.swapAt(parentIndex, currentIndex)
    currentIndex = parentIndex
  }
}

func minHeap() {
  var currentIndex = 0
  
  guard lastIndex >= 0 else {
    print(0)
    return
  }
  print(heap[0])
  
  var maxChildIndex: Int
  // 자식노드가 존재하지 않는 경우
  if lastIndex < 1 {
    return
  } else if lastIndex == 1 {
    maxChildIndex = lastIndex
  } else {
    let leftChildIndex = currentIndex*2-1
    let rightChildIndex = currentIndex*2-2
    if heap[leftChildIndex] > heap[rightChildIndex] {
      maxChildIndex = leftChildIndex
    } else {
      maxChildIndex = rightChildIndex
    }
    
    while currentIndex*2-1 >= lastIndex {
      
    }
  }
  
  // 왼쪽 자식노드만 존재하는 경우
  
  // 오른쪽 자식노드도 존재하는 경우
}

// MARK: - Note
/*
 Min Heap
 - insertHeap
  - 값을 넣고, 부모의 값이 현재(자식)값보다 크다면, 자식을 부모와 스왑
   - 값을 넣을 때
      - 아무것도 안넣은 상태라면 넣고 종료
      - 나머지의 경우, 넣고 heapify
 - removeHeap
  - 원소가 비어있는 상태라면, 0 출력하고 return
  - 나머지의 경우, 출력하고 heapify
  - heapify:
    - 자식노드와 비교했을 때, 자식노드가 더 작으면 반복
      - 자식노드끼리 maxIndex를 판별해야 함
      - 부모노드와 자식노드를 스왑
 */
