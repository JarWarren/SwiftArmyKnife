//
//  Moods.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 3/1/22.
//

import SwiftUI

struct Moods: View {
    @AppStorage("currentYear") var currentYear: Int = 2022
    @StateObject var model = MoodsModel()
    static let gradient = LinearGradient(
        gradient: Gradient(colors: [.pink, .purple]),
        startPoint: .top,
        endPoint: .bottom
    )
    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    if model.firstDayOfWeek > 1 {
                        ForEach(1..<model.firstDayOfWeek, id: \.self) { _ in
                            Color.clear
                        }
                    }
                    ForEach(model.dates, id: \.self) { date in
                        Circle().fill(Color.gray)
                            .padding(.top)
                    }
                }
            }
            Button(action: {
                model.isPresentingMoodEditor = true
            }, label: {
                Text("How was today?")
                    .foregroundColor(.white)
                    .padding()
                    .background(Self.gradient)
                    .cornerRadius(12)
            })
        }
        .padding()
        .navigationTitle("Moods \(currentYear)")
        .popover(isPresented: $model.isPresentingMoodEditor) {
            Text("Mood Editor")
        }
        .onAppear { model.updateDates(year: currentYear) }
        .onChange(of: currentYear) { newValue in
            model.updateDates(year: newValue)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    currentYear -= 1
                }, label: {
                    Text("Previous")
                })
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    currentYear += 1
                }, label: {
                    Text("Next")
                })
            }
        }
    }
}

struct Mood_Previews: PreviewProvider {
    static var previews: some View {
        Moods()
    }
}
