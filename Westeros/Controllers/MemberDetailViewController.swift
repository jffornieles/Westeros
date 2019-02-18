//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 16/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    // MARK: - Properties
    var model: Person
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aliasLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        syncModelWithView()
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
