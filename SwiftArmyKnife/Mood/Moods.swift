//
//  Moods.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 3/1/22.
//

import SwiftUI

struct Moods: View {
    @StateObject var model = MoodsModel()
    static let gradient = LinearGradient(
        gradient: Gradient(colors: [.pink, .purple]),
        startPoint: .top,
        endPoint: .bottom
    )
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    let colors = [Color.red, .orange, .yellow, .blue, .green,
                  .gray, .gray, .gray, .gray, .gray, .gray]
    
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
                        if let random = colors.randomElement(),
                           random == .gray {
                            Rectangle().fill(random)
                                .aspectRatio(1, contentMode: .fit)
                        } else {
                            Rectangle().fill(Color.pink.opacity(Double.random(in: 0.2...1)))
                            
                                .aspectRatio(1, contentMode: .fit)
//                                .foregroundColor(.pink.opacity(Double.random(in: 0.2...1)))
                        }
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
        .navigationTitle("Moods " + String(Calendar.current.component(.year, from: Date())))
        .popover(isPresented: $model.isPresentingMoodEditor) {
            Text("Mood Editor")
        }
        .onAppear(perform: model.onAppear)
    }
}

struct Mood_Previews: PreviewProvider {
    static var previews: some View {
        Moods()
    }
}
