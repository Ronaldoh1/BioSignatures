//
//  DocumentListPresenter.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Foundation
import UIKit

class DocumentListPresenter: NSObject {
    
    private weak var view: DocumentListViewType?
    private let router: DocumentListRouterType?
    private let interactor: DocumentListInteractorType?
    
    private let documents: [Document] = []
    
    required init(view: DocumentListViewType, router: DocumentListRouterType, interactor: DocumentListInteractorType) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension DocumentListPresenter: DocumentListPresenterType {
    
    func viewDidAppear() {
        
    }
    
    func signUp(email: String, password: String) {
        
    }
    
}

extension DocumentListPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) else {
            return UITableViewCell()
        }
        return cell
    }
}
