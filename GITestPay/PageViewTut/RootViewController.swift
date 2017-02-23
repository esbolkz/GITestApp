//
//  RootViewController.swift
//  PageViewTut
//
//  Created by kraft on 2/22/17.
//  Copyright © 2017 yesbolapple. All rights reserved.
//

import UIKit

class RootViewController: UIPageViewController
{
    
    
    let place = Restaurant()
    
    var rating:[[Int]]{
        get{
            return place.rating
        }
    }
    
    typealias pageVC = OrNavViewController
    
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> pageVC? {
        // Return the data view controller for the given index.
        if (self.rating.count == 0) || (index >= self.rating.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let pageVController = storyboard.instantiateViewController(withIdentifier:"orNav") as!
            pageVC
        
        pageVController.sectionData = self.rating[index]
        pageVController.ind = index
        return pageVController
    }
    
    func indexOfViewController(_ viewController: pageVC) -> Int? {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        var index  = 0
        for element in rating{
            if element == viewController.sectionData{
                return index
            }
            index += 1
        }
        return nil
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
                let origin = CGPoint(x: 0, y: self.view.bounds.maxY - 15)
                let size = CGSize(width: self.view.frame.size.width, height: 15)
                view.frame = CGRect(origin: origin, size: size)
            }
        }
    }
 
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        dataSource = self
    
        let pageControl = UIPageControl.appearance()
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.darkGray

        
        let startingViewController: pageVC = viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        
      
        
    }
    

    
}


extension RootViewController: UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = self.indexOfViewController(viewController as! pageVC)!
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = self.indexOfViewController(viewController as! pageVC)!
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.rating.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return rating.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
  
}






