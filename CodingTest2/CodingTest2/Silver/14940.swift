//
//  14940.swift
//  쉬운 최단거리
//
//  Created by SeokHyun on 2/11/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0], m = nm[1] // n: height, m: width
var graph = Array(repeating: [Int](), count: n)
var result = Array(repeating: Array(repeating: "-1", count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
_=(0..<n).map{ graph[$0] = readLine()!.split{$0==" "}.map{Int(String($0))!} }
let endXY: (Int, Int)! = findPoint()
let endX = endXY.0, endY = endXY.1
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

dfs(endX, endY)
paintToZero()

print(
  result
    .map { $0.joined(separator: " ") }
    .joined(separator: "\n")
)

func dfs(_ startX: Int, _ startY: Int) {
  var queue = [(Int, Int, Int)]()
  queue.append((startX, startY, 0))
  var index = 0
  
  while queue.count > index {
    let (cx, cy, count) = queue[index] // dequeue
    result[cy][cx] = String(count)
    for i in 0..<dx.count {
      let nx = dx[i] + cx
      let ny = dy[i] + cy
      if nx >= 0, nx < m,
         ny >= 0, ny < n,
         !visited[ny][nx], graph[ny][nx] == 1 {
        visited[ny][nx] = true
        queue.append((nx, ny, count+1)) // enqueue
      }
    }
    index += 1
  }
}

func paintToZero() {
  for i in 0..<n {
    for j in 0..<m {
      if graph[i][j] == 0 {
        result[i][j] = String(0)
      }
    }
  }
}

func findPoint() -> (Int, Int)? {
  for i in 0..<n {
    for j in 0..<m {
      if graph[i][j] == 2 {
        return (j, i)
      }
    }
  }
  return nil
}

// MARK: - Note
/*
 - 목표 지점의 index를 startX, startY로 만들고, dfs 순회하며 counting
   ㄴ graph == 1인 경우에만 bfs 수행해야 graph가 2일때 result가 정상적으로 들어온다.
 - 알게된 문법: joined메소드의 반환타입은 String이다.
 */
