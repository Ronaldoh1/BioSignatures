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
    
    private let documents: [Document] = [Document(title: "VR Company NDA", assignedTo: "Assigned to Billy"), Document(title: "Consulting Company NDA", assignedTo: "Assigned to Billy"), Document(title: "Car Company NDA", assignedTo: "Assigned to Billy"), Document(title: "Film Company NDA", assignedTo: "Assigned to Billy")]
    
    required init(view: DocumentListViewType, router: DocumentListRouterType, interactor: DocumentListInteractorType) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension DocumentListPresenter: DocumentListPresenterType {
    
    func viewDidAppear() {
        
    }

    func didSelectItem(at indexPath: IndexPath) {
        router?.presentDocumentDetailsViewController(sender: view as! UIViewController, document: documents[indexPath.row])
    }
}

extension DocumentListPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DocumentCell.cellID, for: indexPath) as? DocumentCell else {
            return UITableViewCell()
        }
        return cell
    }
}
