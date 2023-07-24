//
//  OnBoardingViewController.swift
//  OnBoardingPage
//
//  Created by Agnes Triselia Yudia on 24/07/23.
//

import UIKit

class OnBoardingPageViewCtr: UIViewController {
    var scroll: OnBoardingPageView!
    var page: UIPageControl!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let content = [PageView(title: "apa coba", subtitle: "ya coba aja", image: UIImage(named: "OB1workInBeanbag")),
                       PageView(title: "ya gitu", subtitle: "iooio", image: UIImage(named: "OB1lampu"))]
        
        scroll = OnBoardingPageView(content: content)
        page = UIPageControl(frame: .zero)
        page.translatesAutoresizingMaskIntoConstraints = false
        page.currentPage = 0
        page.numberOfPages = content.count
        
        view.addSubview(scroll)
        view.addSubview(page)
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            page.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            page.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            page.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        for (index, item) in content.enumerated() {
            item.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
            item.nextButton.tag = index
        }
        
        page.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
    }
    
    @objc func nextButtonTapped(sender: UIButton) {
        let index = sender.tag
        let nextIndex = index + 1
        if nextIndex < scroll.content.count {
            scroll.scrollToItem(at: IndexPath(item: nextIndex, section: 0), at: .right, animated: true)
            page.currentPage = nextIndex
        }
    }
    
    @objc func pageChanged() {
        let currentPage = page.currentPage
        let contentOffsetX = CGFloat(currentPage) * scroll.frame.width
        let contentOffset = CGPoint(x: contentOffsetX, y: 0)
        scroll.setContentOffset(contentOffset, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

