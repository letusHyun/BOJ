//
//  7562.swift
//  나이트의 이동
//
//  Created by SeokHyun on 2/11/24.
//

let testCase = Int(readLine()!)!
let dx = [-1,1,2,2,1,-1,-2,-2]
let dy = [-2,-2,-1,1,2,2,1,-1]
for _ in 0..<testCase {
  let length = Int(readLine()!)!
  let startXY = readLine()!.split{$0==" "}.map{Int(String($0))!}
  let startX = startXY[0], startY = startXY[1]
  let endXY = readLine()!.split{$0==" "}.map{Int(String($0))!}
  let endX = endXY[0], endY = endXY[1]
  var visited = Array(repeating: Array(repeating: false, count: length), count: length)
  
  dfs(startX, startY,
      endX, endY,
      visited: &visited, length: length)
}

func dfs(_ startX: Int, _ startY: Int,
         _ endX: Int, _ endY: Int,
         visited: inout [[Bool]], length: Int) {
  visited[startY][startX] = true
  var queue = [(Int, Int, Int)]()
  queue.append((startX, startY, 0))
  var index = 0
  while queue.count > index {
    let (currentX, currentY, result) = queue[index] // dequeue
    if currentX == endX, currentY == endY {
      print(result)
      return
    }
    for i in 0..<dx.count {
      let nx = dx[i] + currentX
      let ny = dy[i] + currentY
      if nx >= 0, nx < length,
         ny >= 0, ny < length,
         !visited[ny][nx] {
        visited[ny][nx] = true
        queue.append((nx, ny, result+1)) // enqueue
      }
    }
    index += 1
  }
}

// MARK: - Note
/*
 - night가 움직일 수 있는 경우의 수 8개 정의
 - 최단거리 구해야 하므로, bfs 선정
 - 8개의 경우의 수를 반복순회하면서 방문한 적이 없고 예외처리를 통과한 경우라면 enqueue
    - 이때 인자로 counting을 같이 넘겨주어야 한다.
    - bfs 종료 조건은 dequeue 바로 직후 시점에 서술
 */
