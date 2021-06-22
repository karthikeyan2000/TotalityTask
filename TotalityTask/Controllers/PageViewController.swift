//
//  PageViewController.swift
//  TotalityTask
//
//  Created by Karthikeyan K on 19/06/21.
//

import UIKit
import SkeletonView

class PageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CAAnimationDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var labelBottom: UILabel!
    @IBOutlet weak var buttonBottom: UIButton!
    @IBOutlet weak var iconTop: UIButton!
    @IBOutlet weak var buttonTop: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var iconBottom: UIButton!
    @IBOutlet weak var iconBottomHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconBottomWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressBar: HorizontalProgressBar!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        mainView.layer.cornerRadius = 25
        buttonBottom.layer.cornerRadius = 25
        viewTop.layer.cornerRadius = 10
        iconBottom.layer.cornerRadius = 25
        playButton.layer.cornerRadius = 25
        viewTop.alpha = 0
        labelTop.alpha = 0
        buttonBottom.alpha = 0
        iconTop.alpha = 0
        labelBottom.alpha = 0
        buttonTop.alpha = 0
        collectionView.alpha = 0
        iconBottom.alpha = 0
        iconBottomWidthConstraint.constant = 0
        iconBottomHeightConstraint.constant = 0
        iconBottom.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewTop.slideInFromBottom()
        labelTop.slideInFromRight()
        buttonBottom.slideInFromTop(1.0, 0.0, self)
    }
    
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        iconTop.slideInFromRight()
        labelBottom.slideInFromBottom()
        buttonTop.slideInFromBottom()
        collectionView.slideInFromRight()
    }
    
    
    
    @IBAction func didTapClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapDownload(_ sender: Any) {
        iconBottomWidthConstraint.constant = 50
        iconBottomHeightConstraint.constant = 50
        iconBottom.layoutIfNeeded()
        iconBottom.fadeIn()
        UIView.animate(withDuration: 1.0, animations: {
            self.buttonBottom.frame.size.width -= 50
        })
        buttonBottom.layoutIfNeeded()
        buttonBottom.isHidden = true
        progressBar.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.progressBar.progress = 0.25
            self.progressLabel.text = "\(0.25*30) MB / 30 MB"
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            self.progressBar.progress = 0.5
            self.progressLabel.text = "\(0.5*30) MB / 30 MB"
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            self.progressBar.progress = 0.75
            self.progressLabel.text = "\(0.75*30) MB / 30 MB"
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7), execute: {
            self.progressBar.progress = 1
            self.progressLabel.text = "30 MB / 30 MB"
            self.iconBottom.setImage(UIImage(systemName: "checkmark"), for: .normal)
            self.progressBar.fadeOut()
            self.iconBottom.fadeOut()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.progressBar.isHidden = true
                self.iconBottomWidthConstraint.constant = 0
                self.iconBottomHeightConstraint.constant = 0
                self.iconBottom.layoutIfNeeded()
                self.buttonBottom.isHidden = true
                self.playButton.isHidden = false
            })
        })
    }
    
    @IBAction func didTapPlay(_ sender: Any) {
        guard let popUp1ViewController = storyboard?.instantiateViewController(identifier: "PopUp1ViewController") else {
            return
        }
        present(popUp1ViewController, animated: false, completion: nil)
    }
    
    func animateIncreaseAlpha(flag: Bool) {
        UIView.animate(withDuration: 0.5, animations: {
            self.buttonBottom.alpha = 1
        }, completion: animateDecreaseAlpha)
    }
    
    func animateDecreaseAlpha(flag: Bool) {
        UIView.animate(withDuration: 0.5, animations: {
            self.buttonBottom.alpha = 0.5
        }, completion: animateIncreaseAlpha)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CollectionViewCell
        cell.isSkeletonable = true
        cell.showSkeleton()
        
        return cell
    }
    
}
