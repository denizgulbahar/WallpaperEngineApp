//
//  CollectionViewCell.swift
//  WallpaperEngineApp
//
//  Created by Deniz Gülbahar on 10.07.2022.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    public var model:HitsModel?
    
    let wallpaperImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.addSubview(wallpaperImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model:HitsModel) {
        self.model = model
        guard let url = URL(string: model.previewURL) else {
            return
        }
        wallpaperImageView.sd_setImage(with: url)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        wallpaperImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        wallpaperImageView.image = nil
    }
    
}

