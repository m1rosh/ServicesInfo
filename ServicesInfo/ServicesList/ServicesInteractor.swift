//
//  ServicesInteractor.swift
//  YoulaTestTask
//
//  Created by Сергей Мирошниченко on 26.03.2024.
//

import Foundation
import Alamofire

class ServicesInteractor: ServicesInteractorProtocol {
    var presenter: ServicesPresenterProtocol!
    
    required init(presenter: ServicesPresenterProtocol) {
        self.presenter = presenter
    }

    func loadServices() {
        let services = DataLoader()
        for (ind, service) in services.servicesInfo.body.services.enumerated() {
            AF.request(service.icon_url).responseData { response in
                if let data = response.data {
                    services.servicesInfo.body.services[ind].icon_data = data
                }
                DispatchQueue.main.async {
                    self.presenter.servicesLoaded(services.servicesInfo.body)
                }
            }
        }
    }
}

