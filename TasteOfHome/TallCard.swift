//
//  TallCard.swift
//  TasteOfHome
//
//  Created by Fan Chen on 6/8/17.
//  Copyright © 2017 Fan Chen. All rights reserved.
//

import UIKit

class TallCard: UITableViewCell {
  
  init(searchHit: SearchHit, style: UITableViewCellStyle = .default, reuseIdentifier: String? = "TallCard") {
    self.searchHit = searchHit
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUp()
    setUpConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let searchHit: SearchHit
  private let containerView = UIView()
  private let heroImageView = UIImageView()
  private let blackOverlay = UIView()
  private let horizontalStackView = UIStackView()
  private let verticalStackView = UIStackView()
  private let profileImage = UIImageView()
  private let firstNameLabel = UILabel()
  private let distanceLabel = UILabel()
  private let descriptionLabel = UILabel()
  
  private func setUp() {
    setUpContentView()
    setUpContainerView()
    setUpHeroImage()
    setUpBlackOverlay()
    setUpHorizontalStackView()
    setUpVerticalStackView()
    setUpProfileImage()
    setUpFirstNameLabel()
    setUpDistanceLabel()
    setUpDescriptionLabel()
  }
  
  private func setUpContentView() {
    contentView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
    contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
    contentView.layer.shadowRadius = 4
    contentView.layer.shadowOpacity = 1
    containerView.backgroundColor = UIColor.white
  }
  
  private func setUpContainerView() {
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.clipsToBounds = true
    containerView.layer.cornerRadius = 10
    containerView.layer.borderColor = Colors.lightGray.cgColor
    containerView.layer.borderWidth = 1
    containerView.backgroundColor = UIColor.white
    contentView.addSubview(containerView)
  }
  
  private func setUpHeroImage() {
    heroImageView.translatesAutoresizingMaskIntoConstraints = false
    if let url = URL(string: searchHit.imageURL) {
      heroImageView.sd_setImage(with: url)
    }
    heroImageView.clipsToBounds = true
    containerView.addSubview(heroImageView)
  }
  
  private func setUpBlackOverlay() {
    blackOverlay.translatesAutoresizingMaskIntoConstraints = false
    blackOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    containerView.addSubview(blackOverlay)
  }
  
  private func setUpHorizontalStackView() {
    horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    horizontalStackView.axis = .horizontal
    horizontalStackView.spacing = 20
    horizontalStackView.alignment = .top
    containerView.addSubview(horizontalStackView)
  }
  
  private func setUpVerticalStackView() {
    verticalStackView.translatesAutoresizingMaskIntoConstraints = false
    verticalStackView.axis = .vertical
    verticalStackView.alignment = .center
    verticalStackView.spacing = 4
    horizontalStackView.addArrangedSubview(verticalStackView)
  }
  
  private func setUpProfileImage() {
    profileImage.translatesAutoresizingMaskIntoConstraints = false
    if let url = URL(string: searchHit.imageURL) { //TODO: add profile image
      profileImage.sd_setImage(with: url)
    }
    profileImage.layer.cornerRadius = 20
    profileImage.clipsToBounds = true
    profileImage.layer.borderWidth = 2
    profileImage.layer.borderColor = UIColor.white.cgColor
    verticalStackView.addArrangedSubview(profileImage)
  }
  
  private func setUpFirstNameLabel() {
    firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
    firstNameLabel.text = searchHit.chefTitle
    firstNameLabel.textColor = Colors.orange
    verticalStackView.addArrangedSubview(firstNameLabel)
  }
  
  private func setUpDistanceLabel() {
    distanceLabel.translatesAutoresizingMaskIntoConstraints = false
    distanceLabel.text = searchHit.distance
    distanceLabel.textColor = Colors.orange
    verticalStackView.addArrangedSubview(distanceLabel)
  }
  
  private func setUpDescriptionLabel() {
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.text = searchHit.description
    descriptionLabel.textColor = Colors.orange
    horizontalStackView.addArrangedSubview(descriptionLabel)
  }
  
  private func setUpConstraints() {
    setUpContainerViewContraints()
    setUpHeroImageConstraints()
    setUpBlackOverlayConstraints()
    setUpHorizontalStackViewConstraints()
    setUpVerticalStackViewConstraints()
    setUpProfileImageConstraints()
  }
  
  private func setUpContainerViewContraints() {
    containerView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
    containerView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    containerView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
    containerView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
  }
  
  private func setUpHeroImageConstraints() {
    heroImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
    heroImageView.heightAnchor.constraint(equalTo: heroImageView.widthAnchor, multiplier: 7/16).isActive = true
    heroImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    heroImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
    heroImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true

    heroImageView.contentMode = .scaleAspectFill
  }
  
  private func setUpBlackOverlayConstraints() {
    blackOverlay.leadingAnchor.constraint(equalTo: heroImageView.leadingAnchor).isActive = true
    blackOverlay.trailingAnchor.constraint(equalTo: heroImageView.trailingAnchor).isActive = true
    blackOverlay.topAnchor.constraint(equalTo: heroImageView.topAnchor).isActive = true
    blackOverlay.bottomAnchor.constraint(equalTo: heroImageView.bottomAnchor).isActive = true
  }
  
  private func setUpHorizontalStackViewConstraints() {
    horizontalStackView.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 4).isActive = true
    horizontalStackView.bottomAnchor.constraint(equalTo: containerView.layoutMarginsGuide.bottomAnchor).isActive = true
    horizontalStackView.leadingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leadingAnchor).isActive = true
    horizontalStackView.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor).isActive = true
  }
  
  private func setUpVerticalStackViewConstraints() {
    verticalStackView.widthAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  private func setUpProfileImageConstraints() {
    profileImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor).isActive = true
  }
}
