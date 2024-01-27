//
//  11724.swift
//  연결요소의개수
//
//  Created by SeokHyun on 1/27/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0], m = nm[1]
var graph = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)
_=(0..<m).map{ _ in
  let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
  graph[input[0]].append(input[1])
  graph[input[1]].append(input[0])
}
var result = 0

for i in 1..<n+1 {
  if !visited[i] {
    result += 1
    dfs(i)
  }
}

func dfs(_ i: Int) {
  if visited[i] {
    return
  }
  visited[i] = true
  for v in graph[i] {
    dfs(v)
  }
}

print(result)

// MARK: - Note
/*
 무방향 그래프를 인접리스트로 정의
 - 인접리스트의 row를 순회
  - vertex를 방문한 적이 없으면 연결요소의 개수 추가하고 dfs
 - dfs 내부에서는 인접행렬의 column을 순회
  - 방문한경우는 건너뛰고, 방문한 적 없는 경우는 방문처리 후 dfs
 */
