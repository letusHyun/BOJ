//
//  21736.swift
//  헌내기는 친구가 필요해
//
//  Created by SeokHyun on 2/3/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0], m = nm[1] // n: height, m: width
var graph = Array(repeating: [String](), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
_=(0..<n).map{graph[$0]=readLine()!.map{String($0)}}
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var count = 0
let xy: (Int, Int)! = findMySelf()

dfs(xy.0, xy.1)

if count == 0 {
  print("TT")
} else {
  print(count)
}

func findMySelf() -> (Int, Int)? {
  for i in 0..<n {
    for j in 0..<m {
      if graph[i][j] == "I" {
        visited[i][j] = true
        return (j,i)
      }
    }
  }
  return nil
}

func dfs(_ x: Int, _ y: Int) {
  for i in 0..<dx.count {
    let nx = dx[i] + x
    let ny = dy[i] + y
    
    if nx >= 0, nx < m,
       ny >= 0, ny < n,
       !visited[ny][nx],
       graph[ny][nx] != "X" {
      if graph[ny][nx] == "P" {
        count += 1
      }
      visited[ny][nx] = true
      dfs(nx, ny)
    }
  }
}

// MARK: - Note
/*
 - 2중for문을 사용해서 I의 (col, row) index를 알아낸 후, 그 index로부터 dfs 탐색
    - 조건1: "X"가 아니면 dfs
    - 조건2: "P"를 만나면 counting
 */
