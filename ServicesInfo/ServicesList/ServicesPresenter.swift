//
//  ServicesPresenter.swift
//  YoulaTestTask
//
//  Created by Сергей Мирошниченко on 26.03.2024.
//

import Foundation

class ServicesPresenter: ServicesPresenterProtocol {
    weak var view: ServicesViewProtocol?
    var interactor: ServicesInteractorProtocol!
    var router: ServicesRouterProtocol!
    
    required init(view: ServicesViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.loadServices()
    }
    
    func didSelectService(_ service: Service) {
        if let url = URL(string: service.link){
            router.openUrl(url)
        }
    }
    
    func servicesLoaded(_ services: AllServices) {
        view?.updateServices(services)
    }
}

