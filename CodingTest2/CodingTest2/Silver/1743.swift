//
//  1743.swift
//  음식물 피하기
//
//  Created by SeokHyun on 2/1/24.
//

let nmk = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmk[0] // height
let m = nmk[1] // width
let k = nmk[2] // count
var graph = Array(repeating: Array(repeating: 0, count: m), count: n)
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var maxResult = 0

for _ in 0..<k {
  let yx = readLine()!.split{$0==" "}.map{Int(String($0))!}
  let y = yx[0], x = yx[1]
  graph[y-1][x-1] = 1
}

for i in 0..<n {
  for j in 0..<m {
    if graph[i][j] == 1 {
      graph[i][j] = 0
      maxResult = max(maxResult, dfs(j, i))
    }
  }
}
print(maxResult)

func dfs(_ x: Int, _ y: Int) -> Int {
  var size = 1
  
  for i in 0..<dx.count {
    let nx = dx[i] + x
    let ny = dy[i] + y
    if nx >= 0, nx < m,
       ny >= 0, ny < n,
       graph[ny][nx] == 1 {
      graph[ny][nx] = 0
      size += dfs(nx, ny)
    }
  }
  return size
}
