//
//  Journal.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/18/22.
//

import SwiftUI

struct Journal: View {
    @StateObject var model = JournalModel()
    
    var body: some View {
        List {
            ForEach(model.entries, id: \.self) { entry in
                NavigationLink(destination: JournalEditor(journalModel: model, entry: entry)) {
                    VStack(alignment: .leading) {
                        Text(entry.title)
                            .font(.headline)
                        Text(entry.contents)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }               
            }
            .onDelete(perform: model.delete(indexSet:))
        }
        .listStyle(.plain)
        .navigationTitle("Journal")
        .onAppear(perform: model.loadEntries)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                NavigationLink(destination: JournalEditor(journalModel: model)) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct Journal_Previews: PreviewProvider {
    static var previews: some View {
        Journal()
    }
}
