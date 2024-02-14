//
//  11279.swift
//  최대 힙
//
//  Created by SeokHyun on 2/12/24.
//

let n = Int(readLine()!)!
var heap = Array(repeating: 0, count: 100_000)
var count = 0
var lastIndex = -1
while count < n {
  let x = Int(readLine()!)!
  if x != 0 {
    insertHeap(x) // 힙 추가
  } else {
    maxHeap()
  }
  count += 1
}

func insertHeap(_ x: Int) {
  lastIndex += 1
  heap[lastIndex] = x
  
  var curIndex = lastIndex
  
  while (curIndex-1)/2 >= 0, heap[curIndex] > heap[(curIndex-1)/2] {
    heap.swapAt(curIndex, (curIndex-1)/2)
    curIndex = (curIndex-1)/2
  }
}

func maxHeap() {
  if lastIndex < 0 { // 예외처리
    print("0")
    return
  }
  print(heap[0]) // 1. maxHeap 출력
  // 2. 마지막 노드를 루트노드에 넣음
  heap[0] = heap[lastIndex]
  lastIndex -= 1
  
  // 3. 힙 정렬
  var curIndex = 0
  var maxChildIndex: Int
  
  // 반복문
  // a. 자식노드의 max값 찾기
  // b. 부모노드와 비교하고, 부모가 더 작으면 자식노드와 swap하고 a번 반복, 아니라면 종료
  
  while true {
    let leftChildIndex = curIndex*2+1
    let rightChildIndex = curIndex*2+2
    if lastIndex < leftChildIndex { // 자식노드가 없다면
      return
    } else if lastIndex == leftChildIndex { // 왼쪽 자식노드만 있다면
      maxChildIndex = lastIndex
    } else { // 왼쪽, 오른쪽 자식노드가 있다면
      if heap[leftChildIndex] > heap[rightChildIndex] {
        maxChildIndex = leftChildIndex
      } else {
        maxChildIndex = rightChildIndex
      }
    }
    
    guard heap[curIndex] <= heap[maxChildIndex] else { return } // 부모가 자식보다 더 크다면 return
    heap.swapAt(curIndex, maxChildIndex) // 부모와 자식 swap
    curIndex = maxChildIndex
  }
}
