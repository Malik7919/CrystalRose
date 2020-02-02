////
////  RootViewController.swift
////  LoginTask
////
////  Created by Tech Labs on 8/23/19.
////  Copyright © 2019 Jets39. All rights reserved.
////
//
//import UIKit
//import LocalAuthentication
//
//class RootViewController: UIViewController {
//    private var current: UIViewController?
//    private var rootViewController: UIViewController?
//    private var appSettings: UserDefaultsProtocol?
//
//    init(userDefaults: UserDefaultsProtocol = AppSetting()) {
//        super.init(nibName: nil, bundle: nil)
//        self.appSettings = userDefaults
//        let localAuthenticationContext = LAContext()
//                if userDefaults.getCurrentUserFromUserDefaults()?.biometric == 1 &&  localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
//                    guard let rootViewController = ViewControllersProvider.viewController(className: "biometricsVerificationController", storyboard: .Auth) as? BiometricsVerificationController else {
//                        fatalError("Failed to load BiometricsVerificationController from storyboard")
//                    }
//                    self.rootViewController = rootViewController
//                }
//          else {
//                    guard let rootViewController = ViewControllersProvider.viewController(className: "authViewController", storyboard: .Auth) as? AuthViewController else {
//                        fatalError("Failed to load AuthViewController from storyboard")
//                    }
//                    self.rootViewController = rootViewController
//          }
//        self.current = rootViewController
//    }
//   public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.appSettings = nil
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addChild(current!)
//        current?.view.frame = view.bounds
//        view.addSubview(current!.view)
//        current!.didMove(toParent: self)
//    }
//
//    func showContainerView() {
//        let vc = ContainerController()
//        replaceViewController(newController: vc)
//    }
//    func showCodeGenerator() {
//        let codeGeneratorController =  ViewControllersProvider.viewController(className: "codeGeneratorController", storyboard: .Auth) as! CodeGeneratorController
//        replaceViewController(newController: CustomNavigationController(rootViewController: codeGeneratorController))
//    }
//    func showActivationController() {
//        let  activationController =  ViewControllersProvider.viewController(className: "activationController", storyboard: .Activation) as! ActivationController
//        replaceViewController(newController: CustomNavigationController(rootViewController: activationController))
//    }
//    func showTokenInformationController() {
//        let tokenInformationController =  TokenInfoController()
//        replaceViewController(newController: CustomNavigationController(rootViewController: tokenInformationController))
//    }
//    func showAuthController() {
//        let  authViewController = ViewControllersProvider.viewController(className: "authViewController", storyboard: .Auth) as! AuthViewController
//        replaceViewController(newController: authViewController)
//    }
//    func showVerificationCodeController() {
//        let verificationCodeController = ViewControllersProvider.viewController(className: "verificationCodeController", storyboard: .Auth) as! VerificationCodeController
//        replaceViewController(newController: verificationCodeController)
//    }
//    func replaceViewController(newController: UIViewController){
//        addChild(newController)
//        newController.view.frame = view.bounds
//        view.addSubview(newController.view)
//        newController.didMove(toParent: self)
//        current!.willMove(toParent: nil)
//        current!.view.removeFromSuperview()
//        current!.removeFromParent()
//        current! = newController
//    }
//}
//
