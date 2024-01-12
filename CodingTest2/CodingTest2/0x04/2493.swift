//
//  2493.swift
//  탑
//
//  Created by SeokHyun on 1/11/24.
//

let n = Int(readLine()!)!
let towers = readLine()!.split{$0==" "}.map{Int(String($0))!}
var stack = [(Int, Int)]() // (towerLen, order)
var result = Array(repeating: 0, count: n)

stack.append((towers[0], 1))
for i in 1..<n {
  if towers[i] > stack.last!.0 { // 아래가 더 작다면
    // 아래가 크거나, 스택이 빌때까지 반복해서 pop
    while towers[i] > stack.last!.0 {
      stack.popLast()
      if stack.isEmpty { // 스택이 비어있으면
        result[i] = 0
        break
      }
    }
    if let last = stack.last {
      result[i] = last.1
    }
    stack.append((towers[i], i+1))
  } else { // 아래가 크면 (stack.last가 nil이 아님)
    result[i] = stack.last!.1
    stack.append((towers[i], i+1))
  }
}

print(result.map{String($0)}.joined(separator: " "))
