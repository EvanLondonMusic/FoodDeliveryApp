//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Evan London on 30.01.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        showOnboardingFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    func  showManinFlow() {
        
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinators: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinators)
        
        switch childCoordinators.type {
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}
