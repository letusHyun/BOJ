//
//  1707.swift
//  이분그래프
//
//  Created by SeokHyun on 2/10/24.
//

let tc = Int(readLine()!)!

for _ in 0..<tc {
  let ve = readLine()!.split{$0==" "}.map{Int(String($0))!}
  let v = ve[0], e = ve[1] // v: 정점 개수, e: 간선 개수
  var graph = Array(repeating: [Int](), count: v+1)
  var visited = Array(repeating: false, count: v+1)
  var isAGroup = Array(repeating: false, count: v+1)
  var is이분그래프 = true
  
  _=(0..<e).map{ _ in
    let uv = readLine()!.split{$0==" "}.map{Int(String($0))!}
    graph[uv[0]].append(uv[1])
    graph[uv[1]].append(uv[0])
  }
  
  for v in 1..<v+1 {
    if !visited[v] {
      visited[v] = true
      isAGroup[v] = true
      dfs(v, graph: &graph, visited: &visited, isAGroup: &isAGroup, is이분그래프: &is이분그래프)
    }
  }
  
  if is이분그래프 {
    print("YES")
  } else {
    print("NO")
  }
}

func dfs(_ startIndex: Int, graph: inout [[Int]], visited: inout [Bool], isAGroup: inout [Bool], is이분그래프: inout Bool) {
  for v in graph[startIndex] {
    if !visited[v] { // 방문하지 않았다면
      visited[v] = true
      isAGroup[v] = !isAGroup[startIndex]
      dfs(v, graph: &graph, visited: &visited, isAGroup: &isAGroup, is이분그래프: &is이분그래프)
    } else { // 방문했다면
      if isAGroup[startIndex] == isAGroup[v] {
        is이분그래프 = false
        return
      }
    }
  }
}


// MARK: - Note
/*
 - 핵심은 방문한 적이 있든 없든
 - 방문하지 않은 곳을 자신의 영역과 다르게 정의
 - dfs탐색 중 방문한 곳이라면, 자신과 같은 영역이면 이분그래프 아님
    - is이분그래프 변수를 사용해서 이분그래프가 아니라면, 빠르게 재귀를 탈출과 for문을 종료하는 로직 구현해서 시간 단축
 */
