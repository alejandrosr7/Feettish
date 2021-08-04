//
//  ProviderViewModel.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 28/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import Foundation
import Firebase

class ProviderViewModel: ObservableObject {

    @Published var selectedImages = [SelectedImages]()
    @Published var isEmpty = false
    @Published var gallery = Gallery()
    @Published var errorMessage = ""
    @Published var shoulShowMessage = false
    var databaseService = DatabaseService()

    init() {
    }

    func udateGallery() {
        let storage = Storage.storage()

        storage.reference().child("Gallery").listAll { (result, error) in
            if error != nil {
                self.isEmpty = false
            } else {
                if result.items.isEmpty {
                    self.isEmpty = true
                }

                for i in 0..<result.items.count {
                    let name = result.items[i].name
                    let description = result.items[i].description
                    
                    result.items[i].getMetadata { (meta, error) in
                        if error != nil {
                        }

                        let type = meta?.contentType
                        result.items[i].downloadURL { (url, error) in
                            if error != nil {
                            }

                            // this part is from the viewModel
                            DispatchQueue.main.async {
//                                self.selectedImages.append(Gallery(id: i, name: name, description: description, url: url!.absoluteString))
                            }
                        }
                    }
                }
                
            }
        }
    }

    func uploadGallery() {
        databaseService.uploadGallery(galleryData: gallery) { (error) in
            if error != nil {
                self.errorMessage = error!.localizedDescription
            } else {
                self.errorMessage = Constants.successUpload
                self.gallery.imageSelected.removeAll()
                self.gallery.name = ""
                self.gallery.description = ""
            }
    
            self.shoulShowMessage.toggle()
        }
    }

    func validateUploadGallery() {
        if self.gallery.imageSelected.isEmpty || self.gallery.name.isEmpty || self.gallery.description.isEmpty {
            self.errorMessage = Constants.galleryUploadErrorMessage
        }
    }

    func getGalleries() {
        databaseService.getGalleries { (result, error) in
            if error != nil {
                
            }
        }
    }
}
