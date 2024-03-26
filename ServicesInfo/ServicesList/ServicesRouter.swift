//
//  ServicesRouter.swift
//  YoulaTestTask
//
//  Created by Сергей Мирошниченко on 26.03.2024.
//

import Foundation
import UIKit

class ServicesRouter: ServicesRouterProtocol {
    func openUrl(_ url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
