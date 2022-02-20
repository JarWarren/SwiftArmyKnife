//
//  PhotosModel.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/18/22.
//

import Foundation
import UIKit

class PhotosModel: ObservableObject {
    @Published var image: UIImage?
    @Published var presentedView: PresentedView?
    @Published var isPresentingAlert = false
    
    
    enum PresentedView: String, Identifiable {
        case photoPicker
        case camera
        
        var id: String { rawValue }
    }
}
