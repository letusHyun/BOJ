//
//  16953.swift
//  A->B
//
//  Created by SeokHyun on 2/7/24.
//

let ab = readLine()!.split{$0==" "}.map{Int(String($0))!}
let a = ab[0], b = ab[1]

bfs()

func bfs() {
  var queue = [(Int, Int)]()
  queue.append((a, 1)) // number, counting
  var index = 0
  var flag = false
  
  while queue.count > index {
    let (currentNum, count) = queue[index]
    
    if currentNum == b {
      print(count)
      flag = true
      break
    }
    
    let plusOne = Int(String(currentNum) + "1")!
    for (i, num) in [2, plusOne].enumerated() {
      let nextNum: Int
      if i == 0 {
        nextNum = currentNum * num
      } else {
        nextNum = num
      }
      
      if 1...1_000_000_000 ~= nextNum {
        queue.append((nextNum, count+1))
      }
    }
    index += 1
  }
  
  if !flag {
    print(-1)
  }
}

// MARK: - Note
/*
 - (1 ≤ A < B ≤ 10억) 이므로, visited의 메모리를 count: 10억으로 만들면 메모리 초과
 */
