//
//  MoodsModel.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 3/2/22.
//

import Foundation

class MoodsModel: ObservableObject {
    @Published var isPresentingMoodEditor = false
    @Published var dates: [Date] = []
    @Published var firstDayOfWeek = 7
    
    func onAppear() {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: Date())
        let januaryFirst = calendar.date(from: components) ?? Date()
        firstDayOfWeek = calendar.component(.weekday, from: januaryFirst)
        dates = (0...364)
            .compactMap { calendar.date(byAdding: .day, value: $0, to: januaryFirst) }
    }
}
