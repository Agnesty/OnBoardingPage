//
//  PageView.swift
//  OnBoardingPage
//
//  Created by Agnes Triselia Yudia on 24/07/23.
//

import UIKit

class PageView: UIView {
    
        let nextButton: UIButton = {
           let button = UIButton(type: .system)
            button.setTitle("Lanjut", for: .normal)
//            button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
           return button
       }()
       
       init(title: String, subtitle: String, image: UIImage?) {
           super.init(frame: .zero)
           
           let pageTitle: UILabel = {
               let label = UILabel()
               label.numberOfLines = 1
               label.textAlignment = .center
               label.text = title
               return label
           }()
           
           let pageSubtitle: UILabel = {
               let label = UILabel()
               label.numberOfLines = 0
               label.textAlignment = .center
               label.text = subtitle
               return label
           }()
           
           let pageImage: UIImageView = {
               let imageView = UIImageView()
               let image = UIImage(named: "OB1workInBeanbag")
               imageView.translatesAutoresizingMaskIntoConstraints = false
               imageView.contentMode = .scaleAspectFit
               imageView.image = image
               return imageView
           }()
           
           let actionContainer: UIView = {
               let view = UIView()
               view.addSubview(nextButton)
               // Lakukan konfigurasi tambahan untuk container view sesuai kebutuhan
               return view
           }()
           
           let topView: UIView = {
               let view = UIView()
               view.addSubview(pageImage)
               // Lakukan konfigurasi tambahan untuk top view sesuai kebutuhan
               return view
           }()
           
           let bottomView: UIView = {
               let view = UIView()
               view.addSubview(pageTitle)
               view.addSubview(pageSubtitle)
               view.addSubview(actionContainer)
               // Lakukan konfigurasi tambahan untuk bottom view sesuai kebutuhan
               return view
           }()
           
           // Lakukan konfigurasi tata letak (layout) antara topView dan bottomView sesuai kebutuhan
           // Contoh: Anda dapat menggunakan UIStackView atau Auto Layout constraints
           
           // Misalnya, jika menggunakan UIStackView untuk menampilkan topView dan bottomView secara vertikal:
           let stackView: UIStackView = {
               let stackView = UIStackView(arrangedSubviews: [topView, bottomView])
               stackView.axis = .vertical
               stackView.alignment = .fill
               stackView.distribution = .fill
               stackView.spacing = 20 // Sesuaikan dengan jarak antara topView dan bottomView
               return stackView
           }()
           
           addSubview(stackView)
           // Lakukan konfigurasi tambahan untuk tampilan utama (view) sesuai kebutuhan
    
      addSubview(topView)
      addSubview(bottomView)
        
      NSLayoutConstraint.activate([
        topView.topAnchor.constraint(equalTo: topAnchor),
        topView.leadingAnchor.constraint(equalTo: leadingAnchor),
        topView.trailingAnchor.constraint(equalTo: trailingAnchor),
        topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
          
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
        bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
        bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
          
        pageTitle.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12),
        pageTitle.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 8),
        pageTitle.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -8),
          
        pageSubtitle.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 12),
        pageSubtitle.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 8),
        pageSubtitle.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -8),
          
        actionContainer.topAnchor.constraint(equalTo: pageSubtitle.bottomAnchor),
        actionContainer.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
        actionContainer.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
        actionContainer.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
          
        nextButton.widthAnchor.constraint(equalToConstant: 52),
        nextButton.heightAnchor.constraint(equalToConstant: 52),
        nextButton.trailingAnchor.constraint(equalTo: actionContainer.trailingAnchor, constant: -12),
        nextButton.bottomAnchor.constraint(equalTo: actionContainer.bottomAnchor, constant: -12),
      ])
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
