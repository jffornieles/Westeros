//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 15/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

protocol EpisodeDetailViewControllerDelegate {
    func episodeDetailViewController(_ viewController: EpisodeDetailViewController, shouldShowSeasons: [Episode])
}

class EpisodeDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directedLabel: UILabel!
    @IBOutlet weak var writedLabel: UILabel!
    @IBOutlet weak var issueDateLabel: UILabel!
    
    // MARK: - Properties
    var model: Episode
    var delegate: EpisodeDetailViewControllerDelegate?
    
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let notificationCenter = NotificationCenter.default
        let notificationName = Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME)
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange(notification:)), name: notificationName, object: nil)
        syncModelWithView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func seasonDidChange(notification: Notification) {
        
        guard let info = notification.userInfo, let season = info[SEASON_KEY] as? Season else {
            return
        }
        
        delegate?.episodeDetailViewController(self, shouldShowSeasons: season.sortedEpisodes)
        navigationController?.popViewController(animated: true)
    }
    
    func syncModelWithView() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let displayDate = dateFormatter.string(from: model.issueDate)
        title = model.title
        titleLabel.text = model.title
        directedLabel.text = model.directedBy
        writedLabel.text = model.writedBy
        issueDateLabel.text = "\(displayDate)"
    }
}

