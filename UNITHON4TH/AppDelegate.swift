//
//  AppDelegate.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 3..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import CoreData
import Material
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    
    // 앱 구동 초기에 조립하여 사용하기 위한 VC들을 정의합니다.
    lazy var navigationController : AppNavigationController =
        {
            UIStoryboard.drawerVC(identifier: ViewIdentifier.AppNavigationController) as! AppNavigationController
    }()
    
    lazy var rootViewController : BottomNavigationController =
        {
            UIStoryboard.drawerVC(identifier: ViewIdentifier.AppBottomNavigationController) as! AppBottomNavigationController
    }()

    lazy var leftViewController : DrawerViewController = {
        UIStoryboard.drawerVC(identifier: ViewIdentifier.DrawerViewController) as! DrawerViewController
    }()
    
    lazy var rightViewController : RightDrawerDummyVC = {
        UIStoryboard.drawerVC(identifier: ViewIdentifier.RightDrawerDummyVC) as! RightDrawerDummyVC
    }()
    
    lazy var libraryViewController : UIViewController =
        {
            UIStoryboard.drawerVC(identifier: ViewIdentifier.LibraryViewController)
    }()
    
    lazy var bookCrossingVC : UIViewController =
        {
            UIStoryboard.drawerVC(identifier: ViewIdentifier.BookCrossingVC)
    }()
    
    lazy var exchangeVC : UIViewController =
        {
            UIStoryboard.drawerVC(identifier: ViewIdentifier.ExchangeVC)
    }()
    
    lazy var mainViewController : UIViewController =
        {
            UIStoryboard.drawerVC(identifier: ViewIdentifier.MainViewController)
    }()

    lazy var recommendVC : UIViewController =
        {
            UIStoryboard.drawerVC(identifier: ViewIdentifier.RecommendVC)
    }()
    
    lazy var settingViewController : UIViewController =
        {
            UIStoryboard.drawerVC(identifier: ViewIdentifier.SettingViewController)
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //google map key 추가
        GMSServices.provideAPIKey(App.API.googleKey)

        // NavigationController를 정의하고, root에 첫 화면을 넣습니다.
        let libraryNav = AppNavigationController(rootViewController: libraryViewController)
        
        let bookNav = AppNavigationController(rootViewController: bookCrossingVC)
        
        let exchangeNav = AppNavigationController(rootViewController: mainViewController)
        
        let recommendNav = AppNavigationController(rootViewController: recommendVC)
        
        let settingNav = AppNavigationController(rootViewController: settingViewController)
        
        
        rootViewController.viewControllers = [libraryNav,bookNav,exchangeNav,recommendNav,settingNav]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // 네비게이션 컨트롤러를 Drawer 컨트롤러에 감싸고, left drawer와 right drawer를 조립합니다.
        window!.rootViewController = NavigationDrawerController(rootViewController: rootViewController,
                                                                                                           leftViewController: leftViewController,
                                                                                                           rightViewController: rightViewController)
        window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        //self.saveContext()
    }

    // MARK: - Core Data stack

//    lazy var persistentContainer: NSPersistentContainer = {
//        /*
//         The persistent container for the application. This implementation
//         creates and returns a container, having loaded the store for the
//         application to it. This property is optional since there are legitimate
//         error conditions that could cause the creation of the store to fail.
//        */
//        let container = NSPersistentContainer(name: "UNITHON4TH")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                 
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()

    // MARK: - Core Data Saving support

//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }

}

