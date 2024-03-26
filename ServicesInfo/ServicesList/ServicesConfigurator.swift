//
//  ServiceConfigurator.swift
//  YoulaTestTask
//
//  Created by Сергей Мирошниченко on 26.03.2024.
//

import Foundation

class ServicesConfigurator: ServiceConfiguratorProtocol {
    func configure(with viewController: ServicesViewController) {
        let presenter = ServicesPresenter(view: viewController)
        let interactor = ServicesInteractor(presenter: presenter)
        let router = ServicesRouter()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
