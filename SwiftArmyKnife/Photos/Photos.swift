//
//  Photos.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/18/22.
//

import SwiftUI

struct Photos: View {
    @StateObject var model = PhotosModel()
    var body: some View {
        VStack {
            if let image = model.image {
                Image(uiImage: image)
                    .resizable()
            }
        }
        .navigationTitle("Photos")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    model.isPresentingAlert = true
                }, label: {
                    Image(systemName: "photo.on.rectangle.angled")
                })
            }
        }
        .popover(item: $model.presentedView) { view in
            switch view {
            case .photoPicker:
                PhotoPicker(image: $model.image)
            case .camera:
                Camera(image: $model.image)
            }
        }
        .alert("Image Source", isPresented: $model.isPresentingAlert) {
            Button(action: {
                model.presentedView = .photoPicker
            }, label: {
                Text("Gallery")
            })
            Button(action: {
                model.presentedView = .camera
            }, label: {
                Text("Camera")
            })
        }
    }
}

struct Photos_Previews: PreviewProvider {
    static var previews: some View {
        Photos()
    }
}
