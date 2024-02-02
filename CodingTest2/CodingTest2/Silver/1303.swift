//
//  1303.swift
//  전쟁-전투
//
//  Created by SeokHyun on 2/2/24.
//
import Foundation

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0], m = nm[1] // n: width, m: height
var graph = Array(repeating: [String](), count: m)
var wVisited = Array(repeating: Array(repeating: false, count: n), count: m)
var bVisited = Array(repeating: Array(repeating: false, count: n), count: m)
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
_=(0..<m).map{graph[$0]=readLine()!.map{String($0)}}
var result = Array(repeating: 0, count: 2)

for i in 0..<m {
  for j in 0..<n {
    if !wVisited[i][j], graph[i][j] == "W" {
      wVisited[i][j] = true
      result[0] += Int(pow(Double(dfsW(j, i)), 2))
    }
    
    if !bVisited[i][j], graph[i][j] == "B" {
      bVisited[i][j] = true
      result[1] += Int(pow(Double(dfsB(j, i)), 2))
    }
  }
}

print(result.map{String($0)}.joined(separator: " "))

func dfsW(_ x: Int, _ y: Int) -> Int {
  var count = 1
  
  for i in 0..<dx.count {
    let nx = dx[i] + x
    let ny = dy[i] + y
    if nx >= 0, nx < n,
       ny >= 0, ny < m,
       !wVisited[ny][nx],
       graph[ny][nx] == "W" {
      wVisited[ny][nx] = true
      count += dfsW(nx, ny)
    }
  }
  return count
}

func dfsB(_ x: Int, _ y: Int) -> Int {
  var count = 1
  
  for i in 0..<dx.count {
    let nx = dx[i] + x
    let ny = dy[i] + y
    if nx >= 0, nx < n,
       ny >= 0, ny < m,
       !bVisited[ny][nx],
       graph[ny][nx] == "B" {
      bVisited[ny][nx] = true
      count += dfsB(nx, ny)
    }
  }
  return count
}
