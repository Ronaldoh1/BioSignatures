//
//  DocumentTableViewCell.swift
//  BioSignatures
//
//  Created by Ahmad, Sara on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit
import SnapKit

class DocumentTableViewCell: UITableViewCell {
    
    //top label
    private lazy var topLabel: UILabel = {
      let label = UILabel()
      label.text = "NDA Sign Off Needed"
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
      return label
    } ()
    
    //second label
    private lazy var assignedToLabel: UILabel = {
        let label = UILabel()
        label.text = "Assigned to Billy Johnson"
        return label
    } ()
    
    //third label
    private lazy var timestamp: UILabel = {
        let label = UILabel()
        return label
    } ()
    
    //stackView
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topLabel, assignedToLabel, timestamp])
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    } ()
    
    //chevron image
    private lazy var chevronImg: UIImageView = {
        let chevron = UIImageView(image: #imageLiteral(resourceName: "right-chevron"))
        return chevron
    } ()
    
    private lazy var checkImage: UIImageView = {
        let check = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
        check.isHidden = true
        return check
    } ()

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup () {
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(mainStackView)
        contentView.addSubview(chevronImg)
        contentView.addSubview(checkImage)
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
        
        mainStackView.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.leftMargin)
            $0.top.equalTo(contentView.snp.topMargin)
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
