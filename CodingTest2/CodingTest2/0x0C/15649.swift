//
//  15649.swift
//  N과M(1)
//
//  Created by SeokHyun on 1/15/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0] // 1부터 N까지 숫자
let m = nm[1] // 수열의 길이
var isVisited = Array(repeating: false, count: 10)
var result = Array(repeating: 0, count: m)

func bt(_ index: Int) { // index는 m을 따라가는 변수
  if index == m { // 길이를 초과하면
    print(result.map{String($0)}.joined(separator: " ")) // 출력하고 재귀 탈출
    return
  }
  
  for i in 1..<n+1 { // i를 순차 반복해서 number를 키운다.
    if !isVisited[i] { // 방문한 적 없으면
      isVisited[i] = true // 방문 표시
      result[index] = i
      bt(index+1) // 다음 자리 수로 이동
      isVisited[i] = false
    }
  }
}

bt(0)

// MARK: - Note
// 재귀 함수가 반환되면 이전 자리 수로 이동하게 되는데, 이때 마지막으로 방문했던 숫자를 방문 해제해야 한다.
// 그 숫자가 현재 돌아가는 for문에서 (다음 자리 수에서) 쓰이는 경우는 없고, 다음다음 자리수에서는 쓰일 수 있기 때문이다.
/*
 ex) 세 번째 자리에서 두 번째 자리로 돌아오는 경우, 3을 방문 해제한다면, 언제 3이 사용될까?
 case 1) 1 2 3 4
             ㅅ
 ...
 
 case 2) 1 2 4 3
               ㅅ
 ...
 case 3) 1 2 5 3
               ㅅ
 ...
 case 4) 1 2 6 3
               ㅅ
 
 이렇게 case 1에서 bt(2)가 완료되면, isVisited[3] = false를 해주어야 case2를 만족할 수 있다.
 */
