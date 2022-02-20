//
//  JournalModel.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/18/22.
//

import Foundation

class JournalModel: ObservableObject {
    // MARK: - Properties
    @Published var entries: [JournalEntry] = []
    private var saveFileURL: URL? {
        try? FileManager.default.url(
            for: .documentDirectory,
               in: .userDomainMask,
               appropriateFor: nil,
               create: true
        )
            .appendingPathComponent("journalEntries")
            .appendingPathExtension("json")
    }
    
    // MARK: - CRUD
    func createEntry(title: String, contents: String) {
        let entry = JournalEntry(title: title, contents: contents)
        entries.append(entry)
        saveEntries()
    }
    
    func update(entry: JournalEntry, title: String, contents: String) {
        entry.title = title
        entry.contents = contents
        saveEntries()
    }
    
    func delete(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        entries.remove(at: index)
        saveEntries()
    }
    
    // MARK: - Persistence
    private func saveEntries() {
        guard let url = saveFileURL else { return }
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(entries)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadEntries() {
        guard let url = saveFileURL else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let entries = try decoder.decode([JournalEntry].self, from: data)
            self.entries = entries
        } catch {
            print(error)
        }
    }
}
