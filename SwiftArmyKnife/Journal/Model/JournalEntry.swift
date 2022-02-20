//
//  JournalEntry.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/18/22.
//

import Foundation

class JournalEntry: Codable {
    var title: String
    var contents: String
    
    init(title: String, contents: String) {
        self.title = title
        self.contents = contents
    }
}

extension JournalEntry: Equatable, Hashable {
    static func == (lhs: JournalEntry, rhs: JournalEntry) -> Bool {
        lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
