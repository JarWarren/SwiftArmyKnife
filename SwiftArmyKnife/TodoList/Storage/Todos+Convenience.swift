//
//  Todos+Convenience.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 3/5/22.
//

import Foundation

extension Todo {
    @discardableResult
    convenience init(name: String) {
        self.init(context: TodoListStorage.shared.container.viewContext)
        self.name = name
        self.isComplete = false
    }
}
