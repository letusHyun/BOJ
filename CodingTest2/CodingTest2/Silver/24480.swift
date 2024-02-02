//
//  24480.swift
//  알고리즘수업-깊이우선탐색2
//
//  Created by SeokHyun on 2/2/24.
//

let nmr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmr[0], m = nmr[1], r = nmr[2] // n: vertexCount, m: edgeCount, r: startVertex
var graph = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: 0, count: n+1)
_=(0..<m).map{ _ in
  let nodes = readLine()!.split{$0==" "}.map{Int(String($0))!}
  graph[nodes[0]].append(nodes[1])
  graph[nodes[1]].append(nodes[0])
}
var order = 1

visited[r] = order
dfs(r)

func dfs(_ index: Int) {
  for vertex in graph[index].sorted(by: >) {
    if visited[vertex] == 0 { // 방문한 적 없다면
      order += 1
      visited[vertex] = order
      dfs(vertex)
    }
  }
}

print(visited.map{String($0)}.dropFirst().joined(separator: "\n"))

// MARK: - Note
/*
 - visited 의미:
    - 방문여부 확인
    - 방문순서 저장
 - 인접리스트 사용
    -  내림차순이므로, column 순회할 때 sorted(by: >) 사용
    - startVertex를 기반으로 dfs
 */
