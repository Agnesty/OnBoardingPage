//
//  PageViewCell.swift
//  OnBoardingPage
//
//  Created by Agnes Triselia Yudia on 24/07/23.
//

import UIKit

class PageViewCell: UICollectionViewCell {
    
    //Mengatur dan menampilkan data halaman dalam sel (cell) koleksi (UICollectionView) atau tampilan lainnya sesuai dari model yang dibuat.
    var pageModel: PageModels? {
        didSet {
            guard let unwrappedPage = pageModel else { return }
            
            let lampuView = UIImage(named: unwrappedPage.imageLampu)
            lampuImageView.image = lampuView
            let workImage = UIImage(named: unwrappedPage.imageName)
            workInBeanBagImageView.image = workImage
            
            let attributedLabel = NSMutableAttributedString(string: unwrappedPage.titleText, attributes:[NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)])
            titleLabel.attributedText = attributedLabel
        }
    }
    
    //UI image backgroundnya
    private let backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        let backgroundView = UIImage(named: "OB1background")
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = backgroundView
        return backgroundImageView
    }()
    
    //UI image lampu
    private let lampuImageView: UIImageView = {
        let lampuImageView = UIImageView()
        lampuImageView.translatesAutoresizingMaskIntoConstraints = false
        lampuImageView.contentMode = .scaleAspectFit
        return lampuImageView
    }()
    
    //UI image work
    private let workInBeanBagImageView: UIImageView = {
        let workInBeanBagImageView = UIImageView()
        workInBeanBagImageView.translatesAutoresizingMaskIntoConstraints = false
        workInBeanBagImageView.contentMode = .scaleAspectFill
        return workInBeanBagImageView
    }()
        
    //UI title label
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        let attributedLabel = NSMutableAttributedString(string: "Let's Get Started", attributes:[NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)])
        
        let range = NSRange(location: 0, length: attributedLabel.length)
        let font = UIFont(name: "Poppins", size: 30) ?? UIFont.systemFont(ofSize: 30)
        let fontWeight = UIFont.Weight.heavy
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font.pointSize, weight: fontWeight)]
        attributedLabel.addAttributes(attributes, range: range)
        
        titleLabel.attributedText = attributedLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        return titleLabel
    }()
    
    //UI description label
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2 // Set line-height "normal"
        
        let attributedString = NSMutableAttributedString(string: "Our goal is to ensure that you have everything you need to feel comfortable, confident, and ready to make an impact.", attributes: [NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(hex: "#7D94A0") ?? UIColor.gray, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        // Tambahkan atribut fontWeight dengan nilai 400 (nilai standar untuk normal).
        let range = NSRange(location: 0, length: attributedString.length)
        let font = UIFont(name: "Poppins-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14)
        let fontWeight = UIFont.Weight.regular
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font.pointSize, weight: fontWeight)]
        attributedString.addAttributes(attributes, range: range)
        
        descriptionLabel.attributedText = attributedString
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .left
        descriptionLabel.sizeToFit()
        
        return descriptionLabel
    }()
    
    //Isi contraints dari semua
    private func applyConstraints() {
        
        addSubview(backgroundImageView)
        addSubview(lampuImageView)
        addSubview(workInBeanBagImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            
            //imageBackground
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 72),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 2),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 393),
            
            //lampuImageView
            lampuImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            lampuImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            lampuImageView.widthAnchor.constraint(equalToConstant: 159),
            lampuImageView.heightAnchor.constraint(equalToConstant: 159),
            
            //workInBeanBagImageView
            workInBeanBagImageView.topAnchor.constraint(equalTo: topAnchor, constant: 179),
            workInBeanBagImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            workInBeanBagImageView.widthAnchor.constraint(equalToConstant: 331),
            workInBeanBagImageView.heightAnchor.constraint(equalToConstant: 331),
            
            //titlLabel
            titleLabel.topAnchor.constraint(equalTo: workInBeanBagImageView.bottomAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -39),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 39),
            
            //descriptionTextView
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 39),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            
        ])
    }
    
    //Inisialisasi dari suatu subclass dari UICollectionViewCell yang digunakan untuk membuat tampilan kustom dengan mengatur tata letak menggunakan Auto Layout (atau constraints).
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyConstraints()
    }
    
    //Implementasi dari inisialisasi tambahan init?(coder aDecoder: NSCoder) yang diperlukan ketika Anda menggunakan UICollectionViewCell dengan file nib atau storyboard.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
