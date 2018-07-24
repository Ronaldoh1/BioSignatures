//
//  DocumentListViewController.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Foundation

import UIKit

class DocumentListViewController: UIViewController {
    
    var presenter: DocumentListPresenterType?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(DocumentCell.self, forCellReuseIdentifier: DocumentCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self.presenter
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    
    //MARK: Set up views
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        default: break
        }
        
    }
    
    
    private func setupRegularConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(44)
        }
    }
    
}

extension DocumentListViewController: DocumentListViewType {
    
}

extension DocumentListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
