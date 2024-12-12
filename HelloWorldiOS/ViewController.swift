// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var randomCheckbox: UIButton!
    @IBOutlet weak var randomNumberLabel: UILabel!
    @IBOutlet weak var tapMeButtonCenterXLayout: NSLayoutConstraint!
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var simulateButton: UIButton!
    
    private var model = Model()
    private var tapMeContentShown = false {
        didSet {
            showTapMeContentIfNeeded()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
    }

    @IBAction func didTapGenerateRandomNumber(checkbox: UIButton? = nil) {
        randomCheckbox.isSelected.toggle()
        model.isNumberRandom.toggle()
        updateNumberLabel()
    }

    @IBAction func didTapSimulateDifferences(checkbox: UIButton? = nil) {
        simulateButton.isSelected.toggle()
        model.hasDifferences.toggle()
        tapMeContentShown = false
        updateContent()
    }

    @IBAction func tapMeButtonTapped(sender: UIButton? = nil) {
        tapMeContentShown.toggle()
    }

}

private extension ViewController {

    func updateNumberLabel() {
        randomNumberLabel.text = String(model.number)
    }

    func updateContent() {
        helloLabel.attributedText = model.attributedText
        updateNumberLabel()
        tapMeButtonCenterXLayout.constant = model.tapMeButtonCenterXLayoutValue
        imageView.image = UIImage(named: model.imageName)
        showTapMeContentIfNeeded()
    }

    func showTapMeContentIfNeeded() {
        bottomContainer.isHidden = !tapMeContentShown
    }

}
