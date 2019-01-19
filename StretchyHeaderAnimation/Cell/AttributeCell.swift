//
//  AttributeCell.swift
//  StretchyHeaderAnimation
//
//  Created by Ashis Laha on 1/19/19.
//  Copyright © 2019 Ashis Laha. All rights reserved.
//

import UIKit

class AttributeCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetUp()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewSetUp()
    }
    private func viewSetUp() {
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            ])
        layer.cornerRadius = 10
    }
    public func setText(_ message: String) {
        label.text = message
    }
}
