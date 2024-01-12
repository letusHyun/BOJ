//
//  10773.swift
//  제로
//
//  Created by SeokHyun on 1/11/24.
//

let k = Int(readLine()!)!
var stack = [Int]()
for _ in 0..<k {
  let elem = Int(readLine()!)!
  if elem == 0 {
    stack.popLast()
  } else {
    stack.append(elem)
  }
}

let sum = stack.reduce(0, +)
print(sum)
