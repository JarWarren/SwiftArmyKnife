//
//  PhotosModel.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/18/22.
//

import Combine
import Foundation
import UIKit

class PhotosModel: ObservableObject {
    @Published var image: UIImage?
    @Published var presentedView: PresentedView?
    @Published var isPresentingAlert = false
    private var subscription: AnyCancellable?
    private var imageURL: URL? {
        try? FileManager
            .default
            .url(
                for: .libraryDirectory,
                   in: .userDomainMask,
                   appropriateFor: nil,
                   create: true
            )
            .appendingPathComponent("photosDemo")
            .appendingPathExtension("jpeg")
    }
    
    func onAppear() {
        loadImage()
        subscription = $image.sink { [weak self] image in
            if let image = image,
               let data = image.jpegData(compressionQuality: 1),
               let url = self?.imageURL {
                try? data.write(to: url)
            }
        }
    }
    
    private func loadImage() {
        if let url = imageURL,
           let data = try? Data(contentsOf: url) {
            image = UIImage(data: data)
        }
    }
    
    enum PresentedView: String, Identifiable {
        case photoPicker
        case camera
        
        var id: String { rawValue }
    }
}
