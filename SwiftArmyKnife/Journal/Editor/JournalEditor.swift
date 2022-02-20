//
//  JournalEditor.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/18/22.
//

import SwiftUI

struct JournalEditor: View {
    @StateObject var model = JournalEditorModel()
    @ObservedObject var journalModel: JournalModel
    @Environment(\.dismiss) var dismiss
    
    var entry: JournalEntry?
    
    var body: some View {
        VStack {
            TextField("Entry title", text: $model.title)
            TextField("Entry contents", text: $model.contents)
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .navigationTitle("Journal Editor")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    if let entry = entry {
                        journalModel.update(entry: entry, title: model.title, contents: model.contents)
                    } else {
                        journalModel.createEntry(title: model.title, contents: model.contents)
                    }
                    dismiss()
                }, label: {
                    Text("Save")
                })
            }
        }
        .onAppear {
            if let entry = entry {
                model.onAppear(entry: entry)
            }
        }
    }
}

struct JournalEditor_Previews: PreviewProvider {
    static var previews: some View {
        JournalEditor(journalModel: JournalModel())
    }
}
