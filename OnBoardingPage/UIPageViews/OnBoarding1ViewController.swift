//
//  OnBoarding1ViewController.swift
//  OnBoardingPage
//
//  Created by Agnes Triselia Yudia on 24/07/23.
//

import UIKit

class OnBoarding1ViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "OB1background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
 
    private let workInBeanBagImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "OB1workInBeanbag")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
        
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Let's Get Started", attributes:[NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
//        attributedText.append(NSAttributedString(string: "\n\n\nOur goal is to ensure that you have everything you need to feel comfortable, confident, and ready to make an impact.", attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor:UIColor.gray]))
        
        titleLabel.attributedText = attributedText
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Our goal is to ensure that you have everything you need to feel comfortable, confident, and ready to make an impact.", attributes:[NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        descriptionLabel.attributedText = attributedText
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionLabel
    }()
        
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
           
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        return button
    }()
        
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .systemPink
        pc.pageIndicatorTintColor = .gray
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
            
        view.backgroundColor = .systemBackground
        
        view.addSubview(backgroundImageView)
        view.addSubview(workInBeanBagImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
            
        applyConstraints()
        setupBottomControls()
    }
    
        
        fileprivate func setupBottomControls(){

                let yellowView = UIView()
                yellowView.backgroundColor = .yellow

                let greenView = UIView()
                greenView.backgroundColor = .green

                let blueView = UIView()
                blueView.backgroundColor = .blue
                let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])

                bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
                bottomControlsStackView.distribution = .fillEqually

                view.addSubview(bottomControlsStackView)

                NSLayoutConstraint.activate([
                    bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                    bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                    bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
                ])
            }
        
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            
            //imageBackground
            backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 331),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 393),
            
            //workInBeanBagImageView
            workInBeanBagImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 179),
            workInBeanBagImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            workInBeanBagImageView.widthAnchor.constraint(equalToConstant: 331),
            workInBeanBagImageView.heightAnchor.constraint(equalToConstant: 331),
            
            //titlLabel
            titleLabel.topAnchor.constraint(equalTo: workInBeanBagImageView.bottomAnchor, constant: 50),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 39),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -39),

            //descriptionTextView
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 39),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -39),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        }


}
