//
//  FullImageViewController.swift
//  WallpaperEngineApp
//
//  Created by Deniz Gülbahar on 9.07.2022.
//

import UIKit
import SDWebImage

class FullLowImageViewController: UIViewController {

    var model:HitsModel?
    
    let wallpaperImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(wallpaperImageView)
        configureImageView()
    }
    
    init(model:HitsModel?) {
        super.init(nibName: nil, bundle: nil)
        self.model = model
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureImageView() {
        guard let model = model else {
            return
        }
        
            if let url = URL(string: model.previewURL) {
                wallpaperImageView.sd_setImage(with: url)
              }
        
    }
    
    override func viewDidLayoutSubviews() {
        wallpaperImageView.frame = CGRect(x: 0, y: 0, width: (view.width*2)/5, height:view.height/10)
        wallpaperImageView.center = view.center
                                        
    }
}
