//
//  PageControllers.swift
//  OnBoardingPage
//
//  Created by Agnes Triselia Yudia on 24/07/23.
//

import Foundation
import UIKit

class PageControllers: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //Isi custom dari PageModels
    let pages = [
        PageModels(imageName: "OB1workInBeanbag", titleText: "Let's Get Started", imageLampu: "OB1lampu"),
        PageModels(imageName: "OB2workInDesk", titleText: "Your Onboarding Journey Begins!", imageLampu: ""),
        PageModels(imageName: "OB3tangan", titleText: "Your First Steps to Success", imageLampu: ""),
    ]
    
    //UI skip button
    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins", size: 15)
        button.setTitleColor(UIColor(hex: "#7D94A0"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(skipBtn), for: .touchUpInside)
        return button
    }()
    
    //Action untuk skip button
    @objc private func skipBtn() {
        view.window?.rootViewController = HomeViewController()
    }
           
    //UI next button
    private let nextButton: UIButton = {
        let button = UIButton(type: .custom) as UIButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next→", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins", size: 15)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(hex: "#272727")
        button.layer.cornerRadius = CGFloat(10)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    //Action untuk next button
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .top, animated: true)
    }
    
    //Page Control setting
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = UIColor(hex: "#272727")
        pc.pageIndicatorTintColor = UIColor(hex: "#828282")
        return pc
    }()
    
    //Untuk Contraints dari semua
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [skipButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
//        bottomControlsStackView.distribution = .fillProportionally
        
        view.addSubview(bottomControlsStackView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 40),
            
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 480),
            pageControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            pageControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            
            ])
    }
    
    //Untuk PageControl indikatornya bisa ke kanan dan ke kiri
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupBottomControls()
        
        //Setting CollectionView: Register, Paging, dan Indikator Horizontal menjadi tak muncul
        collectionView?.register(PageViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    //Mengatur jarak minimum antara baris (line spacing) di dalam suatu section dari koleksi (UICollectionView)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //CollectionView yang dimunculkan sebanyak isi pages sebelumnya
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    //Mengonfigurasi dan mengisi sel (cell) pada koleksi (UICollectionView) dengan data dari sumber yang ada.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageViewCell
        
        let page = pages[indexPath.item]
        cell.pageModel = page
        return cell
    }
    
    //Mengatur ukuran dari setiap sel (cell) di dalam koleksi (UICollectionView): Pada kode ini, setiap sel selalu memiliki ukuran yang sama dengan lebar dan tinggi yang sama dengan lebar dan tinggi dari tampilan koleksi itu sendiri.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    //Menangani perubahan orientasi tampilan (landscape/portrait) pada perangkat. Ketika perubahan orientasi terjadi, metode ini akan dipanggil.
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()

            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }

        }) { (_) in

        }
    }
}
