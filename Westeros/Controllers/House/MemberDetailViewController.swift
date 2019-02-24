//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 16/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

protocol MemberDetailViewControllerDelegate {
    func memberDetailViewControllerDelegate(_ viewController: MemberDetailViewController, shouldShowMembers: [Person])
}

class MemberDetailViewController: UIViewController {

    // MARK: - Properties
    var model: Person
    var delegate: MemberDetailViewControllerDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aliasLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificaionCenter = NotificationCenter.default
        let notificationName = Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME)
        notificaionCenter.addObserver(self, selector: #selector(seasonDidChange(notification:)), name: notificationName, object: nil)
        syncModelWithView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func seasonDidChange(notification: Notification) {
        
        guard let info = notification.userInfo, let house = info[HOUSE_KEY] as? House else {
            return
        }
        
        delegate?.memberDetailViewControllerDelegate(self, shouldShowMembers: house.sortedMembers)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Initialization
    init(model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncModelWithView() {
        nameLabel.text = "Name: \(model.name)"
        aliasLabel.text = "Alias: \(model.alias == "" ? "Unknown": model.alias)"
        houseLabel.text = "House: \(model.house.name)"
    }
}
