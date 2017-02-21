//
//  ImageViewController.swift
//  FlashCard
//
//  Created by AgribankCard on 2/18/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit
import PhotosUI
import Photos
import CoreImage

class ImageViewController: UIViewController {
    var asset: PHAsset!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateImage()
        
    }
    var targetSize: CGSize {
        let scale = UIScreen.main.scale
        return CGSize(width: imageView.bounds.width * scale,
                      height: imageView.bounds.height * scale)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateImage() {
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.isNetworkAccessAllowed = true
        
        PHImageManager.default().requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: options, resultHandler: { image, _ in
            // If successful, show the image view and display the image.
            guard let image = image else { return }
            // Now that we have the image, show it.
            self.imageView.isHidden = false
            self.imageView.image = image
        })
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}


