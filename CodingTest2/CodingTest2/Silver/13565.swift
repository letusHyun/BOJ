//
//  13565.swift
//  침투
//
//  Created by SeokHyun on 2/2/24.
//
import Foundation

let mn = readLine()!.split{$0==" "}.map{Int(String($0))!}
let m = mn[0], n = mn[1] // m: height, n: width
var graph = Array(repeating: [Int](), count: m) // 0: 전류 물질, 1: 격자
var visited = Array(repeating: Array(repeating: false, count: n), count: m)
_=(0..<m).map{graph[$0]=readLine()!.map{Int(String($0))!}}
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

for j in 0..<n {
  if !visited[0][j], graph[0][j] == 0 {
    visited[0][j] = true
    dfs(j, 0)
  }
}

print("NO")

func dfs(_ x: Int, _ y: Int) {
  if y+1 == m {
    print("YES")
    exit(0)
  }
  
  for i in 0..<dx.count {
    let nx = dx[i] + x
    let ny = dy[i] + y
    if nx >= 0, nx < n,
       ny >= 0, ny < m,
       !visited[ny][nx], graph[ny][nx] == 0 {
      visited[ny][nx] = true
      dfs(nx, ny)
    }
  }
}

// MARK: - Note
/*
 - outer side에서 시작해서 inner side로 연결되는지 확인하는 문제
 - row의 index가 0인 경우에만 dfs
    - 재귀의 base case(탈출 조건): 현재 row의 index가 m-1이라면 재귀 종료
    - exit함수 사용하기 위해서는 import Foundation 해주어야 백준에서 에러나지 않음
 */
