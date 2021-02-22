//
//  ImagePicker.swift
//  ImagePickerSwiftUI
//
//  Created by Apple on 23/02/21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image : UIImage?
    @Environment(\.presentationMode) var presentationMode
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Cordinator {
        Cordinator(self)
    }
    
    class Cordinator : NSObject , UINavigationControllerDelegate , UIImagePickerControllerDelegate {
        
        var parent : ImagePicker
        
        init(_ parent : ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    
    
}

