//
//  ServicesProtocols.swift
//  YoulaTestTask
//
//  Created by Сергей Мирошниченко on 26.03.2024.
//

import Foundation

protocol ServicesViewProtocol: AnyObject {
    func updateServices(_ services: AllServices)
}

protocol ServicesInteractorProtocol: AnyObject {
    func loadServices()
}

protocol ServicesPresenterProtocol: AnyObject {
    func viewDidLoad()
    func servicesLoaded(_ services: AllServices)
    func didSelectService(_ service: Service)
}

protocol ServicesRouterProtocol: AnyObject {
    func openUrl(_ url: URL)
}

protocol ServiceConfiguratorProtocol: AnyObject {
    func configure(with viewController: ServicesViewController)
}







