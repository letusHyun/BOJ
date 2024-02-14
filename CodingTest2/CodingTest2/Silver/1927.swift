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
  
  if lastIndex < 0 {
    print(0)
    return
  }
  
  print(heap[0])
  heap[0] = heap[lastIndex]
  lastIndex -= 1
  
  while true {
    let leftChildIndex = currentIndex*2+1
    let rightChildIndex = currentIndex*2+2
    if leftChildIndex > lastIndex { // 자식노드가 없다면
      return
    } else if leftChildIndex == lastIndex { // 자식노드가 왼쪽자식노드 하나라면
      if heap[currentIndex] > heap[leftChildIndex] { // 부모노드가 왼쪽자식노드보다 크다면
        heap.swapAt(currentIndex, leftChildIndex)
        currentIndex = leftChildIndex
      } else {
        return
      }
    } else { // 자식노드가 두개라면
      let minChildIndex: Int
      // minChildIndex 찾기
      if heap[leftChildIndex] > heap[rightChildIndex] {
        minChildIndex = rightChildIndex
      } else {
        minChildIndex = leftChildIndex
      }
      // swap 여부 판별
      if heap[currentIndex] > heap[minChildIndex] {
        heap.swapAt(currentIndex, minChildIndex)
        currentIndex = minChildIndex
      } else {
        return
      }
    }
  }
}

// MARK: - Note
/*
 Min Heap
 */
