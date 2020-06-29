//
//  CompleteProfileStepOneViewController.swift
//  CompanyProject
//
//  Created by ons ben slimen on 6/25/20.
//  Copyright (c) 2020 Ons Ben Slimen. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CompleteProfileStepOneDisplayLogic: class
{
    func displayError(error: Error)
    func updateAddress()
}

class CompleteProfileStepOneViewController: UIViewController, CompleteProfileStepOneDisplayLogic
{
    
    
    var interactor: CompleteProfileStepOneBusinessLogic?
    var router: (NSObjectProtocol & CompleteProfileStepOneRoutingLogic & CompleteProfileStepOneDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = CompleteProfileStepOneInteractor()
        let presenter = CompleteProfileStepOnePresenter()
        let router = CompleteProfileStepOneRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        confViews()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        confNextButton()
    }
    
    // MARK: Views
    
    @IBOutlet weak var backView: UIView!
    
    // MARK: Textfields
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var streetTF: UITextField!
    @IBOutlet weak var postalCodeTF: UITextField!
    
    // MARK: Buttons
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    
    // MARK: Conf Views
    
    func confViews(){
        backView?.layer.cornerRadius = 3
        backView?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        backView?.layer.shadowOpacity = 0.2
        backView?.layer.shadowOffset = .zero
        backView?.layer.shadowRadius = 5
        backView?.layer.shouldRasterize = true
    }
    
    // MARK: Conf buttons
    func confNextButton(){
        nextButton?.layer.cornerRadius = nextButton.frame.height * 0.5
        nextButton?.layer.masksToBounds = true
        nextButton?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        nextButton?.layer.shadowOpacity = 0.15
        nextButton?.layer.shadowOffset = .zero
        nextButton?.layer.shadowRadius = 4
        nextButton?.layer.shouldRasterize = true
    }
    
    
    func displayError(error: Error) {
        print(error)
    }
    
    func updateAddress() {
        let alert = UIAlertController(title: "Success", message: "Done.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    // MARK: Button Next Action
    
    
    @IBAction func nextAction(_ sender: Any) {
        if !countryTF.text!.isEmpty && !stateTF.text!.isEmpty && !cityTF.text!.isEmpty && !streetTF.text!.isEmpty && !postalCodeTF.text!.isEmpty {
            interactor?.updateAddress(country: countryTF.text!, state: stateTF.text!, city: cityTF.text!, street: streetTF.text!, postalCode: Int(postalCodeTF.text!) ?? 0)
               }else{
                   print("emptyyy")
               }
    }
    
    
}
