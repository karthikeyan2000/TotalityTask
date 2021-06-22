//
//  PopUp1ViewController.swift
//  TotalityTask
//
//  Created by Karthikeyan K on 22/06/21.
//

import UIKit

class PopUp1ViewController: UIViewController, CAAnimationDelegate {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleStack: UIStackView!
    @IBOutlet weak var middleStack2: UIStackView!
    @IBOutlet weak var bottomStack: UIStackView!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var stackButton1: UIButton!
    @IBOutlet weak var stackButton2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mainView.alpha = 0
        topLabel.alpha = 0
        middleStack.alpha = 0
        middleStack2.alpha = 0
        bottomStack.alpha = 0
        stackButton1.layer.cornerRadius = 25
        stackButton2.layer.cornerRadius = 25
        bottomButton.layer.cornerRadius = 25
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mainView.slideInFromBottom(1.0, 0.0, self)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.topLabel.fadeIn()
        self.middleStack.slideInFromRight()
        self.middleStack2.slideInFromRight()
        self.bottomStack.slideInFromRight()
    }

    @IBAction func didTapNext(_ sender: Any) {
        guard let popUp2ViewController = storyboard?.instantiateViewController(identifier: "PopUp2ViewController") as? PopUp2ViewController else {
            return
        }
        presentingViewController?.presentSecondaryDetail(popUp2ViewController)
    }
}
