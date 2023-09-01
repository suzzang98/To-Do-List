//
//  Task.swift
//  TodoList
//
//  Created by 이수현 on 2023/08/11.
//

import Foundation
// Codable을 한 이유는 구조체를 데이터 타입으로 저장해주기 위해서. - > JSON으로 인코딩, 디코딩 가능해짐
struct Task: Codable{
    var id: Int
    var title: String
    var isCompleted: Bool
    var category: TaskCategory
}

enum TaskCategory: String, CaseIterable, Codable {
    case none
    case work
    case life
    
    func toIndex() -> Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
    
    static func category(from index: Int) -> Self? {
        Self.allCases.indices ~= index ? Self.allCases[index] : nil
    }
}
