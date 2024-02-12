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

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [OnboardingPartViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage(resource: .chickenLeg1)
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.buttonText = "Next"
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage(resource: .shipped1)
        secondVC.titleText = "Fastt Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.buttonText = "Next"
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage(resource: .medal1)
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        thirdVC.buttonText = "Next"
        
        let fourVC = OnboardingPartViewController()
        fourVC.imageToShow = UIImage(resource: .creditCard1)
        fourVC.titleText = "Payment Online"
        fourVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        fourVC.buttonText = "Cool!"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
