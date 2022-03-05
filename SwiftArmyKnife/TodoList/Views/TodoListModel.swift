//
//  TodoListModel.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 3/5/22.
//

import Foundation

class TodoListModel: ObservableObject {
    @Published var todoName = ""
    
    func createNewTodo() {
        guard !todoName.isEmpty else { return }
        Todo(name: todoName)
        TodoListStorage.shared.save()
        todoName = ""
    }
}
