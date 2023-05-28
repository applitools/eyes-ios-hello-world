// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var randomNumberLabel: UILabel!
    @IBOutlet weak var clickMeButtonCenterXLayout: NSLayoutConstraint!
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!

    private var model = Model()
    private var clickMeContentShown = false {
        didSet {
            showClickMeContentIfNeeded()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
    }

    @IBAction func didTapGenerateRandomNumber(checkbox: UIButton) {
        checkbox.isSelected.toggle()
        model.isNumberRandom.toggle()
        updateNumberLabel()
    }

    @IBAction func didTapSimulateDifferences(checkbox: UIButton) {
        checkbox.isSelected.toggle()
        model.hasDifferences.toggle()
        clickMeContentShown = false
        updateContent()
    }

    @IBAction func clickMeButtonTapped(sender: AnyObject) {
        clickMeContentShown.toggle()
    }

}

private extension ViewController {

    func updateNumberLabel() {
        randomNumberLabel.text = String(model.number)
    }

    func updateContent() {
        helloLabel.attributedText = model.attributedText
        updateNumberLabel()
        clickMeButtonCenterXLayout.constant = model.clickMeButtonCenterXLayoutValue
        imageView.image = UIImage(named: model.imageName)
        showClickMeContentIfNeeded()
    }

    func showClickMeContentIfNeeded() {
        bottomContainer.isHidden = !clickMeContentShown
    }

}
