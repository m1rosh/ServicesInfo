//
//  ViewController.swift
//  YoulaTestTask
//
//  Created by Сергей Мирошниченко on 26.03.2024.
//

import UIKit
import PinLayout

class ServicesViewController: UIViewController, ServicesViewProtocol {
    var data: AllServices?
    var presenter: ServicesPresenterProtocol!
    let configurator = ServicesConfigurator()
    
    private var mainTableView = UITableView()
    
    func updateServices(_ services: AllServices) {
        data = services
        mainTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Сервисы"
        view.backgroundColor = .systemBackground
        view.addSubview(mainTableView)
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        configurator.configure(with: self)
        presenter.viewDidLoad()
        
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

extension ServicesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.services.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        mainTableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let service = data?.services[indexPath.row] {
            presenter.didSelectService(service)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var configuration = UIListContentConfiguration.subtitleCell()
        let currentData = data?.services[indexPath.row]
    
        cell.accessoryType = .disclosureIndicator
        configuration.imageProperties.maximumSize = CGSize(width: 50, height: 50)
        
        configuration.text = currentData?.name
        configuration.secondaryText = currentData?.description
        
        if let data = currentData?.icon_data, let image = UIImage(data: data) {
            configuration.image = image
            
        }
        else {
            configuration.image = UIImage(named: "?")
        }
        
        cell.contentConfiguration = configuration
        
        return cell
    }
}
