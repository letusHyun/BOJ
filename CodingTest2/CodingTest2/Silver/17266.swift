//
//  17266.swift
//  어두운 굴다리
//
//  Created by SeokHyun on 2/20/24.
//

let n = Int(readLine()!)! // n: 굴다리 길이
let m = Int(readLine()!)! // m: 가로등 개수
let x = readLine()!.split{$0==" "}.map{Int(String($0))!}
var h = 1
var isRepeat = false
while true {
  if x[0] - h > 0 {
    h += 1
    continue
  } else if x[x.count-1] + h < n {
    h += 1
    continue
  }
  for i in 0..<x.count-1 {
    if x[i] + h < x[i+1] - h {
      h += 1
      isRepeat = true
      break
    }
  }
  if isRepeat {
    isRepeat = false
  } else {
    break
  }
}

print(h)

// MARK: - Note
/*
 실패하면 h늘리고 반복, 성공 시 반복 종료
 1. 왼쪽 끝 확인
  - if x(0) - h > 0: 실패
 2. 오른쪽 끝 확인
  - if x(0) + h < x(1) - h: 실패
 3. 중간 확인
  - if x(m-1) + h < n: 실패
 
 - 1~3 과정에서 실패하지 않은 경우를 성공으로 간주
 */

// TODO: - 이분탐색 알고리즘으로 풀어보기
