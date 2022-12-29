//
//  Model.swift
//  WallpaperEngineApp
//
//  Created by Deniz Gülbahar on 8.07.2022.
//

import Foundation
class HitsModel:Codable {
    let previewURL:String
    let previewWidth:Int
    let previewHeight:Int
    let webformatURL:String
    let webformatWidth:Int
    let webformatHeight:Int
    let largeImageURL:String
    let imageWidth:Int
    let imageHeight:Int
    let tags:String

    
    init(lowImageURL:String, lowImageWidth:Int,
         lowImageHeight:Int, mediumImageURL:String,
         mediumImageWidth:Int, mediumImageHeight:Int,
         largeImageURL:String, largeImageWidth:Int,
         largeImageHeight:Int, tags:String) {
        self.previewURL = lowImageURL
        self.previewHeight = lowImageHeight
        self.previewWidth = lowImageWidth
        self.webformatURL = mediumImageURL
        self.webformatWidth = mediumImageWidth
        self.webformatHeight = mediumImageHeight
        self.largeImageURL = largeImageURL
        self.imageWidth = largeImageWidth
        self.imageHeight = largeImageHeight
        self.tags = tags
    }
}
