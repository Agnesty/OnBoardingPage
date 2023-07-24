//
//  ViewController.swift
//  OnBoardingPage
//
//  Created by Agnes Triselia Yudia on 24/07/23.
//

import UIKit

class OnBoardingViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var pages: [UIViewController] = {
            return [
                OnBoarding1ViewController(),
                OnBoarding2ViewController(),
                OnBoarding3ViewController()
            ]
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        if let firstPage = pages.first {
        setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else {
                   return nil
               }

        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else {
                    return nil
                }

        return pages[index + 1]
    }

}

