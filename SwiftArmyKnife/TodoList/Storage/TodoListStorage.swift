//
//  TodoListStorage.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 3/5/22.
//

import Foundation
import CoreData

class TodoListStorage {
    static let shared = TodoListStorage()
    let container = NSPersistentContainer(name: "Todos")
    
    private init() {
        load()
    }
    
    func save() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    private func load() {
        container.loadPersistentStores { description, error in
            print(description)
            if let error = error {
                print(error)
            }
        }
    }
    
    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
        save()
    }
}
