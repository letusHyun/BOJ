//
//  24482.swift
//  알고리즘수업 - 깊이우선탐색4
//
//  Created by SeokHyun on 2/10/24.
//

let nmr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmr[0], m = nmr[1], r = nmr[2] // n: 정점 수, m: 간선 수, r: 시작 정점
var visited = Array(repeating: -1, count: n+1)
var adjList = Array(repeating: [Int](), count: n+1)
_=(0..<m).map{ _ in
  let uv = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[uv[0]].append(uv[1])
  adjList[uv[1]].append(uv[0])
}

dfs(r, 0)
print(visited.dropFirst().map{String($0)}.joined(separator: "\n"))

func dfs(_ startIndex: Int, _ depth: Int) {
  visited[startIndex] = depth
  for v in adjList[startIndex].sorted(by: >) { // 내림차순 탐색
    if visited[v] == -1 { // 방문한 적 없다면ㅁ
      dfs(v, depth + 1)
    }
  }
}

// MARK: - Note
/*
 - depth 구하기
 - dfs 함수 내에서 for문 순회 할 때 내림차순으로 설정
    - depth를 저장해야되기 때문에, 재귀함수의 인자로 depth값을 넣어줌
    - 재귀 탈출 시, depth가 줄어들기 때문에, 전역변수를 사용하면 안되고 stack형식(재귀함수의 매개변수)을 사용
 */
