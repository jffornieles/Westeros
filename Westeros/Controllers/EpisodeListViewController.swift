//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 15/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

//protocol EpisodeListViewControllerDelegate {
//    func episodeListViewController(_ vieController: EpisodeListViewController, didSelectedEpisode: Episode)
//}

class EpisodeListViewController: UITableViewController {
    
    // MARK: - Properties
    var model: [Episode]
    // var delegate: EpisodeListViewControllerDelegate?
    
    // MARK: - Initialization
    init(model: [Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let episode = model[indexPath.row]
        let cellId = "EpisodeCell"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        
        cell.textLabel?.text = episode.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        let episodeViewController = EpisodeDetailViewController(model: episode)
        navigationController?.pushViewController(episodeViewController, animated: true)
        // delegate?.episodeListViewController(self, didSelectedEpisode: episode)
    }
}
