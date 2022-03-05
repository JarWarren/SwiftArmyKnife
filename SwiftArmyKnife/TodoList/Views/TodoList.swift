//
//  TodoList.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 3/5/22.
//

import Foundation
import SwiftUI

struct TodoList: View {
    @StateObject var model = TodoListModel()
    
    @SectionedFetchRequest<Bool, Todo>(
        sectionIdentifier: \.isComplete,
        sortDescriptors: [SortDescriptor(\.name)],
        predicate: nil,
        animation: .default
    ) var sectionedTodos: SectionedFetchResults<Bool, Todo>
    
//    @FetchRequest<Todo>(
//        sortDescriptors: [SortDescriptor(\.name)],
//        predicate: nil,
//        animation: nil
//    ) var todos: FetchedResults<Todo>
    
    var body: some View {
        VStack {
            HStack {
                TextField("What do you need to do?", text: $model.todoName)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    model.createNewTodo()
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .padding()
            List {
                ForEach(sectionedTodos) { section in
                    Section(header: Text(section.id ? "Complete" : "Incomplete")) {
                        ForEach(section) { todo in
                            todoRow(todo)
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                let todo = section[index]
                                TodoListStorage.shared.delete(todo)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Todoey")
    }
    
    func todoRow(_ todo: Todo) -> some View {
        Button(action: {
            todo.isComplete.toggle()
            TodoListStorage.shared.save()
        }, label: {
            Label(
                todo.name ?? "",
                systemImage: todo.isComplete ? "checkmark.square" : "square"
            )
        })
    }
}
