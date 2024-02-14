//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Evan London on 30.01.2024.
//

import UIKit

// MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    // MARK: - Methods
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinators: self)
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


// MARK: - Navigation
private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnbordingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
