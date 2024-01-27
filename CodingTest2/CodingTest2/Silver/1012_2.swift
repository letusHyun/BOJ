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
var arr = [[Int]]()
var result = 0

for _ in 0..<testCase {
  let mnk = readLine()!.split{$0==" "}.map{Int(String($0))!}
  width = mnk[0]
  height = mnk[1]
  k = mnk[2]
  arr = Array(repeating: Array(repeating: 0, count: width), count: height)
  _=(0..<k).map{ _ in
    let xy = readLine()!.split{$0==" "}.map{Int(String($0))!}
    arr[xy[1]][xy[0]] = 1
  }
  result = 0
  
  for i in 0..<height {
    for j in 0..<width {
      if arr[i][j] == 1 {
        result += 1
        dfs(j, i)
      }
    }
  }
  
  print(result)
}

func dfs(_ x: Int, _ y: Int) {
  if x < 0 ||
      x >= width ||
      y < 0 ||
      y >= height {
    return
  } else if arr[y][x] == 1 {
    arr[y][x] = 0
    for i in 0..<4 {
      dfs(x+dx[i], y+dy[i])
    }
  }
}
