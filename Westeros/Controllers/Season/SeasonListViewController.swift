//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 14/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

protocol SeasonListViewControllerDelegate {
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectSeason: Season)
}
import UIKit

class SeasonListViewController: UITableViewController {
    
    // MARK: - Properties
    var model: [Season]
    var delegate: SeasonListViewControllerDelegate?
    
    // MARK: - Initialization
    init(model: [Season]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
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
        let season = model[indexPath.row]
        let cellId = "SeasonCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        cell?.textLabel?.text = season.name
        cell?.detailTextLabel?.text = "Number of episodes: \(season.count)"
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let seasonSelected = model[indexPath.row]
        
        delegate?.seasonListViewController(self, didSelectSeason: seasonSelected)
        
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [SEASON_KEY: seasonSelected])
        
        notificationCenter.post(notification)
    }
}

extension SeasonListViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectSeason: Season) {
        let seasonDatailViewController = SeasonDetailViewController(model: didSelectSeason)
        navigationController?.pushViewController(seasonDatailViewController, animated: true)
    }
}



