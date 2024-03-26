//
//  ServiceViewController.swift
//  ServicesInfo
//
//  Created by Сергей Мирошниченко on 25.03.2024.
//

import UIKit
import PinLayout
import Alamofire

class ServiceViewController: UIViewController {
    private var mainTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    private var images = [UIImage?]()
    private let modelData = ModelData()
        
    func downloadImages() {
        for _ in modelData.servicesInfo.body.services {
            images.append(nil)
        }
        
        for (ind, service) in modelData.servicesInfo.body.services.enumerated() {
            AF.request(service.icon_url).responseData { response in
                if let data = response.data {
                    if let image = UIImage(data: data) {
                        self.images[ind] = image
                    }
                }
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Сервисы"
        view.backgroundColor = .systemBackground
        
        view.addSubview(mainTableView)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        downloadImages()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainTableView.pin
            .top(view.pin.safeArea.top)
            .left()
            .right()
            .bottom()
    }
}

extension ServiceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelData.servicesInfo.body.services.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        mainTableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let url = URL(string: modelData.servicesInfo.body.services[indexPath.row].link) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var configuration = UIListContentConfiguration.subtitleCell()
        let currentData = modelData.servicesInfo.body.services[indexPath.row]
        
        cell.accessoryType = .disclosureIndicator
        configuration.imageProperties.maximumSize = CGSize(width: 50, height: 50)
        
        configuration.text = currentData.name
        configuration.secondaryText = currentData.description
        
        if let image = images[indexPath.row] {
            configuration.image = image
        }
        else {
            configuration.image = UIImage(named: "?")
        }
        
        cell.contentConfiguration = configuration
        
        return cell
    }
}
    
    

    
    
