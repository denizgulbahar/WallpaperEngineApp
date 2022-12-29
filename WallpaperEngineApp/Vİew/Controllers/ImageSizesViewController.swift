//
//  PhotoSizesViewController.swift
//  WallpaperEngineApp
//
//  Created by Deniz Gülbahar on 9.07.2022.
//

import UIKit

struct Constants {
    static let cornerRadius:CGFloat = 15.0
}

class ImageSizesViewController: UIViewController {

    var model:HitsModel?

    private let lowImageButton:UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemCyan
        return button
    }()
    private let mediumImageButton:UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemCyan
        return button
    }()
    private let highImageButton:UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemCyan
        return button
    }()
    
    init(model:HitsModel?) {
        super.init(nibName: nil, bundle: nil)
        self.model = model
        configure(with: model!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        navigationController?.navigationItem.backButtonTitle = ""
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(lowImageButton)
        view.addSubview(mediumImageButton)
        view.addSubview(highImageButton)
   
    }
    
    public func configure(with model:HitsModel) {
        
        lowImageButton.setTitle("\(model.previewWidth)X\(model.previewHeight)", for: .normal)
        mediumImageButton.setTitle("\(model.webformatWidth)X\(model.webformatHeight)", for: .normal)
        highImageButton.setTitle("\(model.imageWidth)X\(model.imageHeight)", for: .normal)
        lowImageButton.addTarget(self, action: #selector(lowImageSizesTap), for: .touchUpInside)
        mediumImageButton.addTarget(self, action: #selector(mediumImageSizesTap), for: .touchUpInside)
        highImageButton.addTarget(self, action: #selector(highImageSizesTap), for: .touchUpInside)
    }
    @objc private func lowImageSizesTap() {
        let vc = FullLowImageViewController(model: model)
        vc.title = "Content:\(model!.tags)"
        vc.modalPresentationStyle = .fullScreen
        vc.navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func mediumImageSizesTap() {
        let vc = FullMediumImageViewController(model: model)
        vc.title = "Content:\(model!.tags)"
        vc.modalPresentationStyle = .fullScreen
        vc.navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func highImageSizesTap() {
        let vc = FullHighImageViewController(model: model)
        vc.title = "Content:\(model!.tags)"
        vc.navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        lowImageButton.frame = CGRect(x: 5, y: view.safeAreaInsets.top, width: view.width-10, height:view.height/6 )
        mediumImageButton.frame = CGRect(x: 5, y: lowImageButton.bottom+10, width: view.width-10, height:view.height/6 )
        highImageButton.frame = CGRect(x: 5, y: mediumImageButton.bottom+10, width: view.width-10, height:view.height/6 )
    }
}

    
