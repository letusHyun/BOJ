//
//  10815.swift
//  숫자카드
//
//  Created by SeokHyun on 2/19/24.
//

let n = Int(readLine()!)!
var storage = Set<Int>(readLine()!.split{$0==" "}.map{Int(String($0))!}) // Set 생성자 인자에 배열 넣음
var m = Int(readLine()!)!
var hasValues = readLine()!.split{$0==" "}.map{Int(String($0))!}
var result = ""
_=(0..<m).map{
  if storage.contains(hasValues[$0]) {
    result += "1"
  } else {
    result += "0"
  }
}

print(result.map{String($0)}.joined(separator: " "))

// MARK: - Note
/*
 - 저장 순서는 필요 없고, 저장 여부를 확인하는 것이므로 Set 자료구조 사용
  - 중복허용 x
 
 - Grammar
  - Set의 생성자 인자에 배열을 넣어주어서 초기화 가능
 */
