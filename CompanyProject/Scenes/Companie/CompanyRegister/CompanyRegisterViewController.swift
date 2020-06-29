//
//  CompanyRegisterViewController.swift
//  CompanyProject
//
//  Created by ons ben slimen on 6/19/20.
//  Copyright (c) 2020 Ons Ben Slimen. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit



protocol CompanyRegisterDisplayLogic: class
{
  func displaySomething(viewModel: CompanyRegister.Something.ViewModel)
}

class CompanyRegisterViewController: UIViewController, CompanyRegisterDisplayLogic
{
  var interactor: CompanyRegisterBusinessLogic?
  var router: (NSObjectProtocol & CompanyRegisterRoutingLogic & CompanyRegisterDataPassing)?

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
    let interactor = CompanyRegisterInteractor()
    let presenter = CompanyRegisterPresenter()
    let router = CompanyRegisterRouter()
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
    doSomething()
    confViews()
   
    self.hideKeyboardWhenTappedAround()
    confGoogleButton()
    confLinkedinButton()
    
    
  }
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         confSignUpButton()
    }
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = CompanyRegister.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: CompanyRegister.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
    // MARK: Views
    @IBOutlet weak var backView: UIView!
    
    // MARK: Textfields
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repeatPasswordTF: UITextField!
    
    
    // MARK: Buttons
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK: Conf views
    func confViews(){
        backView?.layer.cornerRadius = 3
        backView?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        backView?.layer.shadowOpacity = 0.2
        backView?.layer.shadowOffset = .zero
        backView?.layer.shadowRadius = 5
        backView?.layer.shouldRasterize = true
    }
    
    // MARK: Conf buttons
    func confSignUpButton(){
        signUpButton?.layer.cornerRadius = signUpButton.frame.height * 0.5
        signUpButton?.layer.masksToBounds = true
        signUpButton?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        signUpButton?.layer.shadowOpacity = 0.15
        signUpButton?.layer.shadowOffset = .zero
        signUpButton?.layer.shadowRadius = 4
        signUpButton?.layer.shouldRasterize = true
    }
    
    func confGoogleButton(){
       
        
        googleButton?.layer.cornerRadius = 0.5 * googleButton.bounds.size.width

        googleButton?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        googleButton?.layer.shadowOpacity = 0.08
        googleButton?.layer.shadowOffset = .zero
        googleButton?.layer.shadowRadius = 4
        googleButton?.layer.shouldRasterize = true
        
        googleButton?.layer.borderWidth = 1
        googleButton?.layer.borderColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 0.2).cgColor
        
        googleButton.contentMode = .center
        let img =  UIImage(named: "google")
        
        googleButton.setImage( Helper.resizeImage(image: img!, targetSize: CGSize(width: googleButton.frame.width/2,height: googleButton.frame.height/2)), for: [])
        
    }
    
    func confLinkedinButton(){
        linkedinButton?.layer.cornerRadius =  0.5 * linkedinButton.bounds.size.width
        
        linkedinButton?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        linkedinButton?.layer.shadowOpacity = 0.05
        linkedinButton?.layer.shadowOffset = .zero
        linkedinButton?.layer.shadowRadius = 4
        linkedinButton?.layer.shouldRasterize = true
        linkedinButton?.layer.borderWidth = 1
        linkedinButton?.layer.borderColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 0.2).cgColor
        linkedinButton.contentMode = .center
        let img =  UIImage(named: "linkedinIcon")
        
        linkedinButton.setImage( Helper.resizeImage(image: img!, targetSize: CGSize(width: linkedinButton.frame.width/2,height: linkedinButton.frame.height/2)), for: [])
        
        
    }
    
    
    func confLoginButton(){
        
    }
    
    

    
}
