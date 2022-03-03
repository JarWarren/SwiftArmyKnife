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
    
    func updateDates(year: Int) {
        let calendar = Calendar.current
        let date = calendar.date(bySetting: .year, value: year, of: Date()) ?? Date()
        firstDayOfWeek = calendar.component(.weekday, from: date)
        dates = (0...364)
            .compactMap { calendar.date(byAdding: .day, value: $0, to: date) }
    }
}
