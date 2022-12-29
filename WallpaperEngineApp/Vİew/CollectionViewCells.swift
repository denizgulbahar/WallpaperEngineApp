//
//  CollectionViewCell.swift
//  WallpaperMVCApp
//
//  Created by Deniz Gülbahar on 8.07.2022.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    let wallpaperImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(wallpaperImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model:HitsModel) {
        guard let url = URL(string: model.previewURL) else {
            return
        }
        wallpaperImageView.sd_setImage(with: url)
    }
    
    override func layoutSubviews() {
        wallpaperImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        wallpaperImageView.image = nil
    }
    
}
