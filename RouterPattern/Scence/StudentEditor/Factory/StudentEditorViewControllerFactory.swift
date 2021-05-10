//
//  OrderViewControllerFactory.swift
//  CoordinatorPattern
//
//  Created by Amirreza Eghtedari on 1/19/1400 AP.
//

import UIKit

class StudentEditorViewControllerFactory {
	
	static func build() -> (StudentNameEditorServiceProtocol, StudentEditorViewController) {
		let router = StudentRouter()
		var interactor = StudentNameEditorFactory.build(router: router)
		let presenter = StudentEditorPresenter(interactor: interactor)
		let viewController = StudentEditorViewController(presenter: presenter)
		
		router.viewController = viewController
		interactor.interactorDelegate = presenter
		presenter.delegate = viewController
		
		return (interactor, viewController)
	}
}
