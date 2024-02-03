//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Evan London on 30.01.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//// MARK: - Navigation methods
//private extension AppCoordinator {
//    func showOnboardingFlow() {
//        
//    }
//    func  showManinFlow() {
//        
//    }
//}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .cyan
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .red
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .purple
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
