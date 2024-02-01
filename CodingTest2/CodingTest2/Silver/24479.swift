//
//  24479.swift
//  알고리즘수업-깊이우선탐색1
//
//  Created by SeokHyun on 1/28/24.
//

let nmr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmr[0] // 정점 수
let m = nmr[1] // 간선 수
let r = nmr[2] // 시작 정점
var adjList = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: 0, count: n+1)
for _ in 0..<m {
  let vertexes = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[vertexes[0]].append(vertexes[1])
  adjList[vertexes[1]].append(vertexes[0])
}
var count = 0

dfs(r)

func dfs(_ startIndex: Int) {
  count += 1
  visited[startIndex] = count
  
  for v in adjList[startIndex].sorted(by: <) {
    if visited[v] == 0 {
      dfs(v)
    }
  }
}

print(visited[1...].map{String($0)}.joined(separator: "\n"))

// MARK: - Note
/*
 - visited 배열을 방문표시와 count 저장 용도로 사용
 - 방문하지 않았을땐 초기값인 0인 상태, 방문표시는 count변수로 대입
 */
