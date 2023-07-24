//
//  OnBoardingPageView.swift
//  OnBoardingPage
//
//  Created by Agnes Triselia Yudia on 24/07/23.
//

import UIKit

class OnBoardingPageView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    let content: [UIView]
        init(content: [UIView]) {
          self.content = content
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .horizontal
          super.init(frame: .zero, collectionViewLayout: layout)
          translatesAutoresizingMaskIntoConstraints = false
          isPagingEnabled = true
          showsVerticalScrollIndicator = false
          showsHorizontalScrollIndicator = false
          delegate = self
          dataSource = self
          register(PageViewCellView.self, forCellWithReuseIdentifier: "cell")
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       content.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageViewCellView
       let content = self.content[indexPath.row]
       cell.fill(view: content)
       return cell
     }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
