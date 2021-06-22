//
//  UIViewControllerExtension.swift
//  TotalityTask
//
//  Created by Karthikeyan K on 22/06/21.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
        guard let presentedViewController = presentedViewController else {
            return
        }
        presentedViewController.dismiss(animated: false) {
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    func dismissDetail() {
        dismiss(animated: false, completion: nil)
    }
}

