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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let notificationCenter = NotificationCenter.default
        let notificationName = Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME )
        
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange(notification:)), name: notificationName, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Damos de baja la notificacion
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func seasonDidChange(notification: Notification) {
        guard let info = notification.userInfo, let season = info[SEASON_KEY] as? Season else {
            return
        }
        self.model = season.sortedEpisodes
        let backButton = UIBarButtonItem(title: "Episodes", style: .plain, target: self, action: Selector(("none")))
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        tableView.reloadData()
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
        episodeViewController.delegate = self
        navigationController?.pushViewController(episodeViewController, animated: true)
    }
}

extension EpisodeListViewController: EpisodeDetailViewControllerDelegate {
    func episodeDetailViewController(_ viewController: EpisodeDetailViewController, shouldShowSeasons: [Episode]) {
        self.model = shouldShowSeasons
        tableView.reloadData()
    }
    
    
}
