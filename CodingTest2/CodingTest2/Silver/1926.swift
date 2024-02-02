//
//  1926.swift
//  그림
//
//  Created by SeokHyun on 2/1/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0], m = nm[1] // n: height, m: width
var graph = Array(repeating: [Int](), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var count = 0
var maxWidth = 0
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
_=(0..<n).map{graph[$0]=readLine()!.split{$0==" "}.map{Int(String($0))!}}

for i in 0..<n {
  for j in 0..<m {
    if graph[i][j] == 1, !visited[i][j] {
      visited[i][j] = true
      count += 1
      maxWidth = max(dfs(j, i), maxWidth)
    }
  }
}

func dfs(_ x: Int, _ y: Int) -> Int {
  var width = 1
  
  for i in 0..<dx.count {
    let nx = dx[i] + x
    let ny = dy[i] + y
    
    if nx >= 0, nx < m,
       ny >= 0, ny < n,
       graph[ny][nx] == 1,
       !visited[ny][nx] {
      visited[ny][nx] = true
      width += dfs(nx, ny)
    }
  }
  return width
}

print(count)
print(maxWidth)

// MARK: - Note
/*
 - 각 그림영역의 width를 재귀함수 지역변수로 정의하고 dfs 반환할 때 마다 더해주는 방식으로 최종 width 계산
 - maxWidth를 통해서 width들의 max값을 저장
 */
