//
//  3187.swift
//  양치기 꿍
//
//  Created by SeokHyun on 2/9/24.
//

let rc = readLine()!.split{$0==" "}.map{Int(String($0))!}
let r = rc[0], c = rc[1] // r: height, c: width
var graph = Array(repeating: [String](), count: r)
_=(0..<r).map{graph[$0]=readLine()!.map{String($0)}}
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var visited = Array(repeating: Array(repeating: false, count: c), count: r)
var kv = Array(repeating: 0, count: 2)

for i in 0..<r {
  for j in 0..<c {
    if graph[i][j] != "#", !visited[i][j] {
      visited[i][j] = true
      let (v, k) = dfs(j, i)
      
      if k > v {
        kv[0] += k
      } else {
        kv[1] += v
      }
    }
  }
}
print(kv.map{String($0)}.joined(separator: " "))

func dfs(_ x: Int, _ y: Int) -> (Int, Int) {
  var vCount = 0 // 늑대
  var kCount = 0 // 양
  
  if graph[y][x] == "v" {
    vCount += 1
  } else if graph[y][x] == "k" {
    kCount += 1
  }
  
  for i in 0..<dx.count {
    let nx = dx[i] + x
    let ny = dy[i] + y
    if nx >= 0, nx < c,
       ny >= 0, ny < r,
       graph[ny][nx] != "#", !visited[ny][nx] {
      visited[ny][nx] = true
  
      let (v, k) = dfs(nx, ny)
      vCount += v
      kCount += k
    }
  }
  return (vCount, kCount)
}

// MARK: - Note
/*
 - 방문한 적 없고, "#"가 아니면 dfs 탐색
    - dfs탐색 끝난 후에 v와 k의 개수를 비교해서 조건에 맞게 최종 값을 저장
 */
