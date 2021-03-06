//
//  CompanyUpdateInfosPresenter.swift
//  CompanyProject
//
//  Created by ons ben slimen on 6/26/20.
//  Copyright (c) 2020 Ons Ben Slimen. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CompanyUpdateInfosPresentationLogic
{
  func presentSomething(response: CompanyUpdateInfos.Something.Response)
}

class CompanyUpdateInfosPresenter: CompanyUpdateInfosPresentationLogic
{
  weak var viewController: CompanyUpdateInfosDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: CompanyUpdateInfos.Something.Response)
  {
    let viewModel = CompanyUpdateInfos.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
