//
//  CollectionViewCell.swift
//  FlashCard
//
//  Created by AgribankCard on 2/18/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit
import PhotosUI
import Photos
class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var representedAssetIdentifier: String!
    
    var thumbnailImage: UIImage! {
        didSet {
            imageView.image = thumbnailImage
        }
    }
    
    
}

