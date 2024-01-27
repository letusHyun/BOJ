//
//  14716.swift
//  현수막
//
//  Created by SeokHyun on 1/27/24.
//

let hw = readLine()!.split{$0==" "}.map{Int(String($0))!}
let h = hw[0], w = hw[1]
var graph = Array(repeating: [Int](), count: h)
_=(0..<h).map{graph[$0]=readLine()!.split{$0==" "}.map{Int(String($0))!}}
let dx = [0, 1, 1, 1, 0, -1, -1, -1]
let dy = [-1, -1, 0, 1, 1, 1, 0, -1]
var result = 0

for i in 0..<h {
  for j in 0..<w {
    if graph[i][j] == 1 {
      result += 1
      dfs(j, i)
    }
  }
}

print(result)

func dfs(_ x: Int, _ y: Int) {
  if x < 0 ||
      x >= w ||
  y < 0 ||
  y >= h ||
  graph[y][x] == 0 {
    return
  }
  
  graph[y][x] = 0
  for i in 0..<dx.count {
    dfs(x+dx[i], y+dy[i])
  }
}
