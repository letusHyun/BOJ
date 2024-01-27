//
//  4963.swift
//  섬의개수
//
//  Created by SeokHyun on 1/27/24.
//

let dx = [0, 1, 1, 1, 0, -1, -1, -1]
let dy = [-1, -1, 0, 1, 1, 1, 0, -1]
var w = 0
var h = 0
var graph = [[Int]]()
while let input = readLine() {
  let wh = input.split{$0==" "}.map{Int(String($0))!}
  w = wh[0]
  h = wh[1]
  if w == 0, h == 0 { break }
  graph = Array(repeating: [Int](), count: h)
  
  _=(0..<h).map{ graph[$0] = readLine()!.split{$0==" "}.map{Int(String($0))!} }
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
}

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
