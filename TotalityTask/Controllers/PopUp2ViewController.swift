//
//  PopUp2ViewController.swift
//  TotalityTask
//
//  Created by Karthikeyan K on 22/06/21.
//

import UIKit

class PopUp2ViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleStack: UIStackView!
    @IBOutlet weak var stackButton1: UIButton!
    @IBOutlet weak var stackButton2: UIButton!
    @IBOutlet weak var stackButton3: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bottomButton.layer.cornerRadius = 25
        stackButton1.layer.cornerRadius = 25
        stackButton2.layer.cornerRadius = 25
        stackButton3.layer.cornerRadius = 25
        topLabel.alpha = 0
        middleStack.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        topLabel.fadeIn()
        middleStack.slideInFromRight()
    }

    @IBAction func didTapNext(_ sender: Any) {
        guard let popUp3ViewController = storyboard?.instantiateViewController(identifier: "PopUp3ViewController") as? PopUp3ViewController else {
            return
        }
        presentingViewController?.presentSecondaryDetail(popUp3ViewController)
    }
}
