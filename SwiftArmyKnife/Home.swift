//
//  ContentView.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/16/22.
//

import SwiftUI

struct Home: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("A mini app store of demo projects")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                    .padding(.bottom)
                LazyVGrid(columns: columns) {
                    DemoAppIcon(name: "Image", color: .cyan, destination: ImageFetcher())
                    DemoAppIcon(name: "Journal", color: .brown, destination: Journal())
                    DemoAppIcon(name: "Moods", color: .purple, destination: Moods())
                    DemoAppIcon(name: "Photos", color: .green, destination: Photos())
                    DemoAppIcon(name: "Pokedex", color: .red, destination: Pokedex())
                    DemoAppIcon(name: "Todoey", color: .yellow, destination: TodoList())
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Swift Army Knife")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct DemoAppIcon<Destination: View>: View {
    let name: String
    let color: Color
    let destination: Destination
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                if let firstLetter = name.first {
                    Image(systemName: "\(firstLetter.lowercased()).square")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundColor(color)
                }
                Text(name)
                    .font(.caption)
                    .lineLimit(1)
                    .foregroundColor(.primary)
            }
        }
    }
}
