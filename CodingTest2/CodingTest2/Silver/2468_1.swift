//
//  2468.swift
//  안전 영역
//
//  Created by SeokHyun on 1/27/24.
//

let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n)
_=(0..<n).map{graph[$0]=readLine()!.split{$0==" "}.map{Int(String($0))!}}
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var result = [Int]()
let dx = [0, 1, 0, -1]
let dy = [-1, 0, 1, 0]

for flooding in 0..<100 {
  var count = 0
  for i in 0..<n {
    for j in 0..<n {
      if dfs(j, i, flooding) {
        count += 1
      }
    }
  }
  result.append(count)
  visited = Array(repeating: Array(repeating: false, count: n), count: n)
}

print(result.max()!)


func dfs(_ x: Int, _ y: Int, _ flooding: Int) -> Bool {
  if x < 0 ||
      x >= n ||
      y < 0 ||
      y >= n {
    return false
  } else if !visited[y][x], graph[y][x] > flooding {
    visited[y][x] = true
    for i in 0..<dx.count {
      _=dfs(dx[i]+x, dy[i]+y, flooding)
    }
    return true
  } else {
    return false
  }
}
