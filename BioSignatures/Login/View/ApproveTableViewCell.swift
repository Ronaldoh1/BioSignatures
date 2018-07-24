//
//  ApproveTableViewCell.swift
//  BioSignatures
//
//  Created by Ahmad, Sara on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit

class ApproveTableViewCell: UITableViewCell {
    
    private lazy var NDAButton: UIButton = {
        let button = UIButton()
        return button
    } ()
    
    private lazy var timeStamp: UILabel = {
        let label = UILabel()
        return label
    } ()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [NDAButton, timeStamp])
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    } ()
    
    private lazy var chevronImg: UIImageView = {
        let chevron = UIImageView(image: #imageLiteral(resourceName: "right-chevron"))
        return chevron
    } ()

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup () {
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(stackView)
        contentView.addSubview(chevronImg)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        default: break
        }
        
    }
    
    private func setupRegularConstraints() {
        
        chevronImg.snp.makeConstraints {
            $0.right.equalTo(contentView.snp.rightMargin)
            $0.top.equalTo(contentView.snp.topMargin)
        }
        
        stackView.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.leftMargin)
            $0.top.equalTo(contentView.snp.topMargin)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
