//
//  TableViewCell.swift
//  WallpaperMVCApp
//
//  Created by Deniz Gülbahar on 10.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    private let textlabel:UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textlabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        textlabel.frame = contentView.bounds
    }
    
    public func configure(with model:String) {
        textlabel.te
    }
}
