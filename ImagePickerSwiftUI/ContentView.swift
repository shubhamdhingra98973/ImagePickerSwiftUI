//
//  ContentView.swift
//  ImagePickerSwiftUI
//
//  Created by Apple on 23/02/21.
//

import SwiftUI

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}

struct ContentView: View {
    @State private var image : Image?
    @State private var showImagePicker = false
    @State private var inputImage : UIImage?
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
                 Button("Open Image Picker") {
                showImagePicker = true
            }
            
        }.sheet(isPresented: $showImagePicker , onDismiss: loadImage) {
            ImagePicker(image : $inputImage)
        }
    }
    
    func loadImage() {
        if let inputImage = inputImage {
        self.image = Image(uiImage:inputImage)
             let imageSaver = ImageSaver()
            imageSaver.writeToPhotoAlbum(image: inputImage)
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
