//
//  SeasonDatailViewController.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 14/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    var model: Season
    
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncModelWithView()
        
        setupUI()
    }
    
    func syncModelWithView() {
        title = model.name
        titleLabel.text = model.name
        dateLabel.text = "Release Date: \(model.releaseDate)"
    }
    
    func setupUI() {
        let episodeButton = UIBarButtonItem(title: "Episodes", style: .plain, target: self, action: #selector(displayEpisodes))
        
        navigationItem.rightBarButtonItem = episodeButton
    }
    
    @objc func displayEpisodes() {
        let episodeViewController = EpisodeListViewController(model: model.sortedEpisodes)
        navigationController?.pushViewController(episodeViewController, animated: true)
    }
    
}

extension SeasonDetailViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectSeason: Season) {
        self.model = didSelectSeason
        syncModelWithView()
    }
}
