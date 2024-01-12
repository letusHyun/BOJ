//
//  2504.swift
//  괄호의 값
//
//  Created by SeokHyun on 1/10/24.
//

func run() {
  let editer = readLine()!.map{String($0)}
  var stack = [String]()
  var result = 0
  var temp = 0
  for char in editer {
    switch char {
    case "(", "[":
      stack.append(char)
    case ")":
      guard let last = stack.last else {
        print("0")
        return
      }
      if last == "(" {
        stack.popLast()
        stack.append("2")
      } else if last == "[" {
        print("0")
        return
      } else { // stack.last가 숫자라면
        while let last = stack.last, last != "(" {
          guard let intValue = Int(stack.removeLast()) else {
            print("0")
            return
          }
          temp += intValue
        }
        guard let last = stack.popLast(), last == "(" else {
          print("0")
          return
        }
        stack.append("\(temp*2)")
        temp = 0
      }
    case "]":
      guard let last = stack.last else {
        print("0")
        return
      }
      if last == "[" {
        stack.popLast()
        stack.append("3")
      } else if last == "(" {
        print("0")
        return
      } else { // stack.last가 숫자라면
        while let last = stack.last, last != "[" {
          guard let intValue = Int(stack.removeLast()) else {
            print("0")
            return
          }
          temp += intValue
        }
        guard let last = stack.popLast(), last == "[" else {
          print("0")
          return
        }
        stack.append("\(temp*3)")
        temp = 0
      }
    default:
      break
    }
  }
  
  while let last = stack.popLast() {
    if let last = Int(last) {
      result += Int(last)
    } else {
      print("0")
      return
    }
  }
  print(result)
}

run()
