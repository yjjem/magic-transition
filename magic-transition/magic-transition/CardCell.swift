//
//  CardCell.swift
//  magic-transition
//
//  Copyright (c) 2023 Jeremy All rights reserved.
    

import UIKit

final class CardCell: UITableViewCell {
    
    let largeImageView: UIView = .init()
    let titleLabel: UILabel = .init()
    let secondaryTitleLabel: UILabel = .init()
    let descriptionLabel: UILabel = .init()
    let contentStack: UIStackView = .init()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        secondaryTitleLabel.text = nil
        descriptionLabel.text = nil

    }
    
    func configureTextDesign() {
        titleLabel.font = .systemFont(ofSize: 36, weight: .bold)
        secondaryTitleLabel.font = .systemFont(ofSize: 24, weight: .regular)
        secondaryTitleLabel.textColor = .systemGray2
    }
    
    func configureLayout() {
        configureTextDesign()
        largeImageView.backgroundColor = .systemBlue
        
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.addArrangedSubview(largeImageView)
        contentStack.addArrangedSubview(secondaryTitleLabel)
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(descriptionLabel)
        
        contentStack.axis = .vertical
        contentStack.alignment = .center
        contentStack.distribution = .equalCentering
        
        contentView.addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            contentStack.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            largeImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            largeImageView.heightAnchor.constraint(equalTo: largeImageView.widthAnchor)
        ])
    }
    
    func insertData(title: String, secondary: String, description: String) {
        titleLabel.text = title
        secondaryTitleLabel.text = secondary
        descriptionLabel.text = description
    }
}
