//
//  PDPHeaderView.swift
//  StretchyHeaderAnimation
//
//  Created by Ashis Laha on 1/19/19.
//  Copyright © 2019 Ashis Laha. All rights reserved.
//

import UIKit

class PDPHeaderView: UICollectionReusableView {
    
    public var animator: UIViewPropertyAnimator?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "img")
        return imageView
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
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
            ])
        addBlurVisulaEffectView()
    }
    
    // MARK:- add visual effect view
    private func addBlurVisulaEffectView() {
        
        animator = UIViewPropertyAnimator(duration: 4.0, curve: .easeInOut, animations: { [weak self] in
            guard let strongSelf = self else { return }
            
            let blurEffect = UIBlurEffect(style: .regular)
            let visulaEffectView = UIVisualEffectView(effect: blurEffect)
            visulaEffectView.translatesAutoresizingMaskIntoConstraints = false
            strongSelf.addSubview(visulaEffectView)
            
            NSLayoutConstraint.activate([
                visulaEffectView.topAnchor.constraint(equalTo: strongSelf.topAnchor, constant: 0),
                visulaEffectView.leadingAnchor.constraint(equalTo: strongSelf.leadingAnchor, constant: 0),
                visulaEffectView.bottomAnchor.constraint(equalTo: strongSelf.bottomAnchor, constant: 0),
                visulaEffectView.trailingAnchor.constraint(equalTo: strongSelf.trailingAnchor, constant: 0)
                ])
        })
    }
}
