//
//  DocumentCell.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/24/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit

class DocumentCell: UITableViewCell {
    
    static let cellID = "DocumentCell"
    
    private let documentTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Document NDA"
        return label
    }()
    
    private let assignedTo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "Assigned to Billy Johnson"
        return label
    }()
    
    private let timeStamp: UILabel = {
        let label = UILabel()
        label.text = "07-22-2018 1:20 PM"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let disclosureImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "right-chevron"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let checkMarkImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var document: Document? {
        didSet {
            self.documentTitle.text = document?.title
            self.assignedTo.text = document?.assignedTo
            self.timeStamp.text = document?.date?.toString(withFormat: "yyyy-MM-dd HH:mm")
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstrains()
        default: break
        }
    }
    
    private func setupViews() {
        addSubview(documentTitle)
        addSubview(assignedTo)
        addSubview(timeStamp)
        addSubview(disclosureImageView)
        addSubview(checkMarkImageView)
    }
    
    private func setupRegularConstrains() {
        checkMarkImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        disclosureImageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        documentTitle.snp.makeConstraints { (make) in
            make.left.equalTo(checkMarkImageView.snp.right).offset(16)
            make.top.equalToSuperview().offset(20)
            make.right.equalTo(disclosureImageView.snp.left)
        }
        
        assignedTo.snp.makeConstraints { (make) in
            make.left.equalTo(documentTitle.snp.left)
            make.top.equalTo(documentTitle.snp.bottom).offset(5)
            make.right.equalTo(documentTitle.snp.right)
            make.height.equalTo(15)
        }
        
        timeStamp.snp.makeConstraints { (make) in
            make.left.equalTo(assignedTo.snp.left)
            make.top.equalTo(assignedTo.snp.bottom).offset(5)
            make.right.equalTo(assignedTo.snp.right)
            make.height.equalTo(15)
        }
        
        
    }
    
}


extension Date {
    
    func toString(withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let myString = formatter.string(from: self)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = format
        
        return formatter.string(from: yourDate!)
    }
}
