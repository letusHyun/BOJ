//
//  10845.swift
//  CodingTest2
//
//  Created by SeokHyun on 1/12/24.
//

let n = Int(readLine()!)!
var queue = Array(repeating: 0, count: 10_000)
var front = -1 // 삭제
var rear = -1 // 삽입
var count = 0

for _ in 0..<n {
  let order = readLine()!.split{$0==" "}.map{String($0)}
  switch order[0] {
  case "push":
    rear += 1
    queue[rear] = Int(order[1])!
    count += 1
  case "pop":
    if rear == front { // rear와 front 같으면 비어있음
      print("-1")
    } else { // rear front 같지 않다면, dequeue
      front += 1
      print(queue[front])
      count -= 1
    }
  case "size":
    print(count)
  case "empty":
    rear == front ? print(1) : print(0)
  case "front":
    rear == front ? print(-1) : print(queue[front+1])
  case "back":
    rear == front ? print(-1) : print(queue[rear])
  default:
    break
  }
}
