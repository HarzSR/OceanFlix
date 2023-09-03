//
//  HeroHeaderUIView.swift
//  OceanFlix
//
//  Created by Hariharan Thiagarajan on 3/09/23.
//

import UIKit

class HeroHeaderUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateButtonColors(for: playButton)
            updateButtonColors(for: downloadButton)
        }
    }

    func updateButtonColors(for buttonChange: UIButton) {
        if traitCollection.userInterfaceStyle == .dark {
            buttonChange.layer.borderColor = UIColor.white.cgColor
            buttonChange.backgroundColor = .systemBackground // Invert to light background
            buttonChange.setTitleColor(.white, for: .normal) // Invert to dark text color
        }
        else {
            buttonChange.layer.borderColor = UIColor.black.cgColor
            buttonChange.backgroundColor = .systemBackground // Invert to dark background
            buttonChange.setTitleColor(.black, for: .normal) // Invert to light text color
        }
    }
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()

    private func addGradiant() {
        let gradientLayer = CAGradientLayer()
        
        if traitCollection.userInterfaceStyle == .dark {
            gradientLayer.colors = [
                UIColor.clear.cgColor,
                UIColor.black.cgColor
            ]
        }
        else {
            gradientLayer.colors = [
                UIColor.clear.cgColor,
                UIColor.white.cgColor
            ]
        }
        
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    private func applyConstraints(for button: UIButton, leadingConstant: CGFloat = 0, tailingConstant: CGFloat = 0, bottomConstant: CGFloat, widthConstant: CGFloat) {
        var constraints: [NSLayoutConstraint] = []
            
        if leadingConstant == 0 {
            constraints.append(button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: tailingConstant))
        }
        if tailingConstant == 0 {
            constraints.append(button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingConstant))
        }
        
        constraints.append(button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomConstant))
        constraints.append(button.widthAnchor.constraint(equalToConstant: widthConstant))
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradiant()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints(for: playButton, leadingConstant: 70, bottomConstant: -50, widthConstant: 120)
        applyConstraints(for: downloadButton, tailingConstant: -70, bottomConstant: -50, widthConstant: 120)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
