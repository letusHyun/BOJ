//
//  7569.swift
//  토마토
//
//  Created by SeokHyun on 2/27/24.
//

let mnh = readLine()!.split{$0==" "}.map{Int(String($0))!}
let m = mnh[0], n = mnh[1], h = mnh[2] // m: 가로, n: 세로, h: 높이
var graph = Array(repeating: Array(repeating: [Int](), count: n), count: h) // -1: 토마토 x, 0: 익지 않은 토마토, 1: 익은 토마토
let dx = [-1, 0, 1, 0, 0, 0]
let dy = [0, -1, 0, 1, 0, 0]
let dz = [0, 0, 0, 0, 1, -1]
for i in 0..<h {
  for j in 0..<n {
    graph[i][j] = readLine()!.split{$0==" "}.map{Int(String($0))!}
  }
}

func bfs(_ startX: Int, _ startY: Int, _ startZ: Int) {
  
}
// MARK: - Note
/*
 1. 익은 토마토 주변에 익지 않은 토마토가 있다면, 익은 토마토로 바꿔주기(주변의 기준은 조건에 의해 정해져있음)
  - 이때 익지않은 토마토를 익은 토마토로 만들어줘야 한다면, 모든 graph를 순회할때까지 기다렸다가 순회가 끝나고 한번에 바꿔주어야 한다. (저장변수를 추가로 만들어야 할듯..)
 2. 전체를 조정하고 counting
 3차원 배열에 bfs 적용하기
 */
