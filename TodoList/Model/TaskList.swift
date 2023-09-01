//
//  TaskList.swift
//  TodoList
//
//  Created by 이수현 on 2023/08/11.
//

import Foundation

struct TaskList{
    private static let database = UserDefaults.standard
    private static let key = "TaskList"
    
    static func filerCategory(category: TaskCategory) -> [Task] {
        return Self.taskList().filter{$0.category == category}
    }
    static func completeList() -> [Task] {
        return Self.taskList().filter({ $0.isCompleted == true})
    }
    static func taskList() -> [Task]{
        if let encodedTaskList = TaskList.database.object(forKey: TaskList.key) as? Data,
           let taskList = try? JSONDecoder().decode([Task].self, from: encodedTaskList){ return taskList}

        return []
    }
    
    static func addTask(_ task: Task) {
        var taskList = Self.taskList()
        taskList.append(task)
        Self.updateTaskList(taskList)
    }
    
    static func updateTaskList(_ taskList : [Task]) {
        if let encodedTaskList = try? JSONEncoder().encode(taskList) {
            TaskList.database.set(encodedTaskList, forKey: TaskList.key)
        }
    }
//    static var list: [Task] = [
//        Task(id: 0, title: "iOS 강의 듣기", isCompleted: false, category: TaskCategory.work),
//        Task(id: 1, title: "고양이 밥주기", isCompleted: false, category: TaskCategory.life)
//    ]
    

    static func completeTask(task: Task, isCompleted: Bool){
        var list = Self.taskList()
        for index in 0..<list.count {
            if list[index].id == task.id{
                list[index].isCompleted = isCompleted
            }
        }
        updateTaskList(list)
    }
    
    static func editTask(task: Task, title: String){
        var list = Self.taskList()
        for index in 0..<list.count {
            if list[index].id == task.id{
                list[index].title = title
            }
        }
        updateTaskList(list)
    }
    
//    static func deleteTask(task: Task){
//        list.removeAll(where: { &0.id == task.id})
//    }
}
