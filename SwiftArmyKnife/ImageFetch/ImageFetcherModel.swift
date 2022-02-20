//
//  ImageFetcherModel.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/16/22.
//

import Foundation
import UIKit

@MainActor
class ImageFetcherModel: ObservableObject {
    @Published var randomImage: UIImage?

    func fetchRandomImage() async {
        guard let url = URL(string: "https://source.unsplash.com/random") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let image = UIImage(data: data)
            randomImage = image
        } catch {
            print(error)
        }
    }
}
