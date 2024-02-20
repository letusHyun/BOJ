//
//  1439_2.swift
//  뒤집기
//
//  Created by SeokHyun on 2/20/24.
//

let s = readLine()!
let zeroCount = s.split{$0=="1"}.map{String($0)}.count
let oneCount = s.split{$0=="0"}.map{String($0)}.count
if zeroCount == 0 || oneCount == 0 {
  print(0)
} else {
  print(min(zeroCount, oneCount))
}

// MARK: - Note
/*
 - split의 작동방식 선행 학습
 */
