//
//  24483.swift
//  알고리즘수업 - 깊이우선탐색5
//
//  Created by SeokHyun on 2/10/24.
//

let nmr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmr[0], m = nmr[1], r = nmr[2] // n: 정점 수, m: 간선 수, r: 시작 정점
var visited = Array(repeating: -1, count: n+1) // 방문여부 && depth
var order = Array(repeating: 0, count: n+1) // 방문순서
var adjList = Array(repeating: [Int](), count: n+1)
_=(0..<m).map{ _ in
  let uv = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[uv[0]].append(uv[1])
  adjList[uv[1]].append(uv[0])
}
var orderCount = 1

dfs(r, 0)

var result = 0
for i in 1..<n+1 {
  result += order[i] * visited[i] // t * d
}
print(result)

func dfs(_ startIndex: Int, _ depth: Int) {
  visited[startIndex] = depth
  order[startIndex] = orderCount
  
  for v in adjList[startIndex].sorted(by: <) { // 인접리스트 오름 차순 순회
    if visited[v] == -1 { // 방문한 적 없다면
      orderCount += 1
      dfs(v, depth + 1)
    }
  }
}

// MARK: - Note
/*
 - t: 노드의 방문 순서
 - d: 노드의 깊이
 
 - depth
    - dfs호출 시 +1되어야 하고, dfs 탈출 시, -1되어야 한다. 즉, dfs탈출 시 stack에서 pop되어야 하기 때문에 재귀함수의 인자로 넣어서 사용한다.
 - order
    - 순서는 dfs 탈출이 되어도 계속 +1을 더해주어야 하기 때문에, counting해주는 변수를 전역으로 설정하고 재귀 호출할때마다 +1 해준다.
 */
