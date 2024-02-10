//
//  24481.swift
//  알고리즘수업 - 깊이우선탐색3
//
//  Created by SeokHyun on 2/9/24.
//

let nmr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmr[0], m = nmr[1], r = nmr[2] // n: 정점 수, m: 간선 수, r: 시작 정점
var adjList = Array(repeating: [Int](), count: n+1)
_=(0..<m).map{ _ in
  let uv = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[uv[0]].append(uv[1])
  adjList[uv[1]].append(uv[0])
}
var visited = Array(repeating: -1, count: n+1)
visited[r] = 0
dfs(r, 0)
print(visited.map{String($0)}.dropFirst().joined(separator: "\n"))

func dfs(_ index: Int, _ depth: Int) {
  for node in adjList[index].sorted(by: <) {
    if visited[node] == -1 {
      visited[node] = depth + 1
      dfs(node, depth + 1)
    }
  }
}

// MARK: - Note
/*
 방문 순서가 아닌, 깊이를 출력해야 한다.
 - 깊이가 깊어질수록 +1
    - dfs 인자로 depth+1을 넘겨준다.
 - 깊이가 같으면 같은 깊이를 저장
    - dfs의 매개변수로 받은 depth를 +1해서 for문에서 처리
 */
