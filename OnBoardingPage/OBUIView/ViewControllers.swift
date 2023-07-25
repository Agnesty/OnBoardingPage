//
//  ViewController.swift
//  OnBoardingPage
//
//  Created by Agnes Triselia Yudia on 25/07/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class ViewControllers: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
        // Calculate the next index
        let nextIndex = selectedCellIndex + 1
        // Check if the next index is within the bounds of the collection view data
        if nextIndex >= 0 && nextIndex < pages.count {
            // Update the selectedCellIndex to the next index
            selectedCellIndex = nextIndex
            // Scroll the collection view to the desired index
            let indexPath = IndexPath(item: selectedCellIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            // Update the indicator colors based on the updated selectedCellIndex
            updateIndicatorColors(for: selectedCellIndex)
        }
    }
    
    //Leading View as PageControl
    let garisLeading: UIView = {
          let garisLeading = UIView()
        garisLeading.translatesAutoresizingMaskIntoConstraints = false // Add this line to deactivate autoresizing mask constraints
        garisLeading.layer.cornerRadius = 4.0
        garisLeading.backgroundColor = .gray
        return garisLeading
      }()
      
    //Center View as PageControl
    let garisCenter: UIView = {
        let garisCenter = UIView()
        garisCenter.translatesAutoresizingMaskIntoConstraints = false // Add this line to deactivate autoresizingmask constraints
        garisCenter.layer.cornerRadius = 4.0
        garisCenter.backgroundColor = .gray
        return garisCenter
    }()
    
    //Trailing View as PageControl
    let garisTrailing: UIView = {
        let garisTrailing = UIView()
        garisTrailing.translatesAutoresizingMaskIntoConstraints = false // Add this line to deactivate autoresizingmask constraints
        garisTrailing.layer.cornerRadius = 4.0
        garisTrailing.backgroundColor = .gray
        return garisTrailing
    }()
   
    var indicatorLeadingConstraint: NSLayoutConstraint!
    var selectedCellIndex = 0
    
    //Untuk kalau sudah di indexPageControl ke 2 ada perubahan pada UI skipButton dan nextButton
    private func updateButtonVisibility(_ indexPath: IndexPath) {
        if indexPath.item == 2 {
            skipButton.isHidden = true
            nextButton.setTitle("Next", for: .normal)
            nextButton.addTarget(self, action: #selector(skipBtn), for: .touchUpInside)
        } else {
            skipButton.isHidden = false
            nextButton.setTitle("Next→", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        setupBottomControls()
        
        //Setting CollectionView: Register, Paging, dan Indikator Horizontal menjadi tak muncul
        collectionView?.register(PageViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    //Untuk Contraints semua
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [skipButton, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
//        bottomControlsStackView.distribution = .fillProportionally
        
        view.addSubview(bottomControlsStackView)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        view.addSubview(garisLeading)
        view.addSubview(garisCenter)
        view.addSubview(garisTrailing)
        
        //Button Constraints
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
            ])
        
        //UIView as PageControl Constraints
        NSLayoutConstraint.activate([
            garisLeading.heightAnchor.constraint(equalToConstant: 5),
            garisCenter.heightAnchor.constraint(equalToConstant: 5),
            garisTrailing.heightAnchor.constraint(equalToConstant: 5),
            garisLeading.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            garisCenter.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            garisTrailing.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            garisLeading.widthAnchor.constraint(equalToConstant: 26.5),
            garisCenter.widthAnchor.constraint(equalToConstant: 26.5),
            garisTrailing.widthAnchor.constraint(equalToConstant: 26.5),
            garisLeading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            garisCenter.leadingAnchor.constraint(equalTo: garisLeading.leadingAnchor, constant: 35),
            garisTrailing.leadingAnchor.constraint(equalTo: garisCenter.leadingAnchor, constant: 35)
        ])
        updateIndicatorColors(for: 0)
        
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Calculate the updated selected index after the user scrolls
        let currentIndex = Int(round(scrollView.contentOffset.x / scrollView.bounds.width))
        if selectedCellIndex != currentIndex {
            selectedCellIndex = currentIndex
            
            // Update the indicator colors based on the updated selectedCellIndex
            updateIndicatorColors(for: selectedCellIndex)
            // Update the button visibility when the page changes
        }
    }
        
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // Update the selectedCellIndex to the tapped cell's index
            selectedCellIndex = indexPath.item
            
            // Scroll to the selected cell when it's tapped
            //collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            // Update the indicator colors based on the selected cell index
            updateIndicatorColors(for: indexPath.item)
        
            // Update the button visibility when the page changes
            updateButtonVisibility(indexPath)
        }
    
    //Perubahan warna indikator ketika aktif dan tidak
    func updateIndicatorColors(for index: Int) {
        // Update the colors of all indicators based on the selected index
        garisLeading.backgroundColor = index == 0 ? UIColor(hex: "#272727") : UIColor(hex:"#828282")?.withAlphaComponent(0.15)
        garisCenter.backgroundColor = index == 1 ? UIColor(hex: "#272727") : UIColor(hex:"#828282")?.withAlphaComponent(0.15)
        garisTrailing.backgroundColor = index == 2 ? UIColor(hex: "#272727") : UIColor(hex:"#828282")?.withAlphaComponent(0.15)
    }
    
    //Memunculkan collection sebanyak pages nya
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    //Mengonfigurasi dan mengisi sel (cell) pada koleksi (UICollectionView) dengan data dari sumber yang ada
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageViewCell
        
        let page = pages[indexPath.item]
        cell.pageModel = page
        
        updateButtonVisibility(indexPath)
        return cell
    }
    
    //Mengatur jarak minimum antara baris (line spacing) di dalam suatu section dari koleksi (UICollectionView)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //Mengatur ukuran dari setiap sel (cell) di dalam koleksi (UICollectionView): Pada kode ini, setiap sel selalu memiliki ukuran yang sama dengan lebar dan tinggi yang sama dengan lebar dan tinggi dari tampilan koleksi itu sendiri.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }

}
