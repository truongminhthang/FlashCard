//
//  PlayingFlashCardVC.swift
//  FlashCard
//
//  Created by AgribankCard on 2/14/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

class PlayingFlashCardVC: UIViewController {
    
    var pageViewController: UIPageViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Configure the page view controller and add it as a child view controller.
        self.pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        
        
        let startingViewController: FlashCardDataViewController = self.modelFlashCardController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        
        self.pageViewController!.dataSource = self.modelFlashCardController
        
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        
        // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
        var pageViewRect = self.view.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        self.pageViewController!.view.frame = pageViewRect
        
        self.pageViewController!.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var modelFlashCardController: ModelFlashCardController {
        // Return the model controller object, creating it if necessary.
        // In more complex implementations, the model controller may be passed to the view controller.
        if _modelFlashCardController == nil {
            _modelFlashCardController = ModelFlashCardController()
        }
        return _modelFlashCardController!
    }
    
    var _modelFlashCardController: ModelFlashCardController? = nil
    
    // MARK: - UIPageViewController delegate methods
    
    
    
    
}


