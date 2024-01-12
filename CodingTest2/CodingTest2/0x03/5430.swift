//
//  5430.swift
//  AC
//
//  Created by SeokHyun on 1/12/24.
//

// R은 뒤집기, D는 버리기

// R이 홀수번: rear를 통한 삭제
// R이 짝수번: front를 통한 삭제
// 최종 출력은 R의 홀짝 여부에 따라 다름
  // - 홀수: 역출력
  // - 짝수: 정출력

import Foundation

let testCase = Int(readLine()!)!
var isError = false // error로 인한 next testCase 처리

for _ in 0..<testCase {
  let ac = readLine()!.map{String($0)}
  let arrCount = Int(readLine()!)!
  let queue = readLine()!.trimmingCharacters(in: ["[", "]"]).split{$0==","}.map{Int(String($0))!}
  
  var front = -1
  var rear = arrCount-1
  var rCount = 0
  var result = [String]()
  
  for p in ac {
    switch p {
    case "R":
      rCount += 1
    case "D":
      if front == rear {
        print("error")
        isError = true
      }
      if rCount % 2 == 0 { // 짝수
        front += 1
      } else { // 홀수
        rear -= 1
      }
    default:
      break
    }
    if isError {
      break
    }
  }
  
  if !isError {
    if rCount % 2 == 0 {
      while front != rear {
        front += 1
        result.append(String(queue[front]))
      }
    } else {
      while front < rear && rear >= 0 {
        result.append(String(queue[rear]))
        rear -= 1
      }
    }
    print("[", terminator: "")
    print(result.joined(separator: ","), terminator: "")
    print("]")
  } else {
    isError = false
  }
}
