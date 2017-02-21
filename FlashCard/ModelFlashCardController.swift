//
//  ModelFlashCardController.swift
//  FlashCard
//
//  Created by AgribankCard on 2/14/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit
class ModelFlashCardController: NSObject {
    
    var pageData: [String] = [NamePageViewController.page1.rawValue,NamePageViewController.page2.rawValue]
    
    
    override init() {
        super.init()
        // Create the data model.
        //let dateFormatter = DateFormatter()
        //pageData = dateFormatter.monthSymbols
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> FlashCardDataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let identifierController : String
        if (index == 0) {
            identifierController = NamePageViewController.page1.rawValue
        }
        else {
            identifierController = NamePageViewController.page2.rawValue
        }
        let FlashCardDataViewController = storyboard.instantiateViewController(withIdentifier: identifierController) as! FlashCardDataViewController
        FlashCardDataViewController.dataObject = self.pageData[index]
        return FlashCardDataViewController
    }
    
    func indexOfViewController(_ viewController: FlashCardDataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    
}

extension ModelFlashCardController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! FlashCardDataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! FlashCardDataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
}



