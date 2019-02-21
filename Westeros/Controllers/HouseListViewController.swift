//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 09/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

protocol HouseListViewControllerDelegate {
    func houseListViewController(_ viewController: HouseListViewController, didSelectHouse: House)
}

class HouseListViewController: UITableViewController {

    
    // MARK: - Properties
    var model: [House]
    var delegate: HouseListViewControllerDelegate?
    
    // MARK: - Initialization
    init(model: [House]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
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
        
        // Cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        // Creamos una celda
        let cellId = "HouseCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sincronizar celda - house (view - model)
        cell?.textLabel?.text = house.name
        cell?.imageView?.image = house.sigil.image
        
        return cell!
    }
    
    // MARK: - UITableView Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Averiguar la casa que se ha pulsado
        let house = model[indexPath.row]
        
        delegate?.houseListViewController(self, didSelectHouse: house)
        
        // Emitimos la información por notificaciones
        let notificationCenter = NotificationCenter.default
        // Creamos la notificación
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY: house])
        // Enviamos la notificacion
        notificationCenter.post(notification)
        // Guardar la casa seleccionada
        saveLastSelectedHouse(at: indexPath.row)
    }
}

extension HouseListViewController {
    func saveLastSelectedHouse(at index: Int) {
        // UserDefault - write
        let userDefaults = UserDefaults.standard
        userDefaults.set(index, forKey: LAST_HOUSE_KEY)
        userDefaults.synchronize()
    }
    
    func lastSelectedHouse() -> House {
        // UserDefault - read
        let userDefaults = UserDefaults.standard
        let index = userDefaults.integer(forKey: LAST_HOUSE_KEY)
        return house(at: index)
    }
    
    func house(at index: Int) -> House {
        return model[index]
    }
}

extension HouseListViewController: HouseListViewControllerDelegate {
    func houseListViewController(_ viewController: HouseListViewController, didSelectHouse: House) {
        let houseDetailViewController = HouseDetailViewController(model: didSelectHouse)
        navigationController?.pushViewController(houseDetailViewController, animated: true)
    }


}



