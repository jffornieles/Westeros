//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 15/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directedLabel: UILabel!
    @IBOutlet weak var writedLabel: UILabel!
    @IBOutlet weak var issueDateLabel: UILabel!
    
    // MARK: - Properties
    var model: Episode
    
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        syncModelWithView()
    }
    
    func syncModelWithView() {
        title = model.title
        titleLabel.text = model.title
        directedLabel.text = model.directedBy
        writedLabel.text = model.writedBy
        issueDateLabel.text = "\(model.issueDate)"
    }
}

