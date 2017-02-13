//
//  Page1ViewController.swift
//  FlashCard
//
//  Created by AgribankCard on 2/14/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit
class Page1ViewController : FlashCardDataViewController {
    
    
    @IBOutlet weak var dataLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
       
    }
}
