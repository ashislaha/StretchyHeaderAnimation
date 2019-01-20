//
//  ProductDetailsPageViewController.swift
//  StretchyHeaderAnimation
//
//  Created by Ashis Laha on 1/19/19.
//  Copyright © 2019 Ashis Laha. All rights reserved.
//

import UIKit

class ProductDetailsPageViewController: UICollectionViewController {

    // Register Ids
    private let cellId = "cellId"
    private let headerId = "headerId"
    private let padding: CGFloat = 16
    private var headerView: PDPHeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewSetup()
    }
    
    private func collectionViewSetup() {
        collectionView.register(AttributeCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(PDPHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.contentOffset = .zero
      
        if let layout = collectionViewLayout as? CustomPDPLayout {
            layout.minimumLineSpacing = 8
            layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    // show the status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

// MARK:- Collection view data source
extension ProductDetailsPageViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AttributeCell {
            cell.backgroundColor = .green
            cell.setText("Characterstics: \(indexPath.row)")
            return cell
        }
        return UICollectionViewCell()
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? PDPHeaderView else
            { return  UICollectionReusableView() }
            headerView = header
            return header
        }
        return  UICollectionReusableView()
    }
}

// MARK:- Flow layout
extension ProductDetailsPageViewController: UICollectionViewDelegateFlowLayout {
    
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 2 * padding, height: 50)
    }
    
    // header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 250)
    }
}

// MARK:- Scroll view delegate
extension ProductDetailsPageViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        print(contentOffsetY)
        if contentOffsetY < -40 {
            headerView?.animator?.fractionComplete = abs(contentOffsetY) / 200
        } else {
            headerView?.animator?.fractionComplete = 0.0
        }
    }
}
