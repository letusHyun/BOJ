//
//  15240.swift
//  Paint bucket
//
//  Created by SeokHyun on 2/9/24.
//

let rc = readLine()!.split{$0==" "}.map{Int(String($0))!}
let r = rc[0], c = rc[1] // r: height, c: width
var graph = Array(repeating: [Int](), count: r)
var visited = Array(repeating: Array(repeating: false, count: c), count: r)
_=(0..<r).map{graph[$0]=readLine()!.map{Int(String($0))!}}
let yxk = readLine()!.split{$0==" "}.map{Int(String($0))!}
let startY = yxk[0], startX = yxk[1], paintingNum = yxk[2]
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
let startNum = graph[startY][startX]

dfs(startX, startY)
print(graph.map{ $0.reduce(""){ $0 + String($1) } }.joined(separator: "\n"))

func dfs(_ x: Int, _ y: Int) {
  visited[y][x] = true
  graph[y][x] = paintingNum
  
  for i in 0..<dx.count {
    let nx = dx[i] + x
    let ny = dy[i] + y
    
    if nx >= 0, nx < c,
       ny >= 0, ny < r,
       !visited[ny][nx], graph[ny][nx] == startNum {
      dfs(nx, ny)
    }
  }
}

// MARK: - Note
/*
 - graph[startY][startX]의 값을 기반으로 dfs탐색하면서 painting
 
 - 알게된 점
    - joined메소드를 [[Int]]타입인 2차원 배열에서 사용할 수 없음
    - 따라서 [Int]배열을 String 타입으로 만들어준다. 최종적으로 [[Int]]가 [String]으로 변환되고, 이때 joined(separator: "\n")를 적용
      - [Int]인 1차원 배열에서 reduce("") { $0 + String($1) }을 적용하면 String타입 문자열로 변환 가능
 */
