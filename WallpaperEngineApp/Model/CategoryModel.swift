//
//  File.swift
//  WallpaperMVCApp
//
//  Created by Deniz Gülbahar on 8.07.2022.
//

import Foundation

class CategoryModel {
    let category_id:Int
    let category_name:String
    
    init(category_id:Int, category_name:String) {
        self.category_id = category_id
        self.category_name = category_name
    }
}
