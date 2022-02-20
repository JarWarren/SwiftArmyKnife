//
//  PhotoPicker.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/18/22.
//

import PhotosUI
import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let picker = PHPickerViewController(configuration: .init())
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        // nothing to update
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            results.first?.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { object, error in
                if let error = error {
                    print(error)
                }
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        self.parent.image = image
                    }
                }
            })
            parent.dismiss()
        }
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker(image: Binding(get: { nil }, set: { _ in }))
    }
}
