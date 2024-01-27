//
//  1012.swift
//  유기농배추
//
//  Created by SeokHyun on 1/27/24.
//

let testCase = Int(readLine()!)!
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var width = 0
var height = 0
var k = 0
var visited = [[Bool]]()
var arr = [[Int]]()

for _ in 0..<testCase {
  let mnk = readLine()!.split{$0==" "}.map{Int(String($0))!}
  width = mnk[0]
  height = mnk[1]
  k = mnk[2]
  visited = Array(repeating: Array(repeating: false, count: width), count: height)
  arr = Array(repeating: Array(repeating: 0, count: width), count: height)
  _=(0..<k).map{ _ in
    let xy = readLine()!.split{$0==" "}.map{Int(String($0))!}
    arr[xy[1]][xy[0]] = 1
  }
  
  var result = 0
  
  for i in 0..<height {
    for j in 0..<width {
      if dfs(j, i) {
        result += 1
      }
    }
  }
  print(result)
}

func dfs(_ x: Int, _ y: Int) -> Bool {
  if x < 0 ||
      x >= width ||
      y < 0 ||
      y >= height {
    return false
  }
  if !visited[y][x], arr[y][x] == 1 {
    visited[y][x] = true
    for i in 0..<4 {
      _=dfs(x + dx[i], y + dy[i])
    }
    return true
  }
  return false
}
