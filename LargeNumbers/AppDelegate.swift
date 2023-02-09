//
//  AppDelegate.swift
//  LargeNumbers
//
//  Created by Igor Zhukov on 08.02.2023.
//

import UIKit
import BigInt

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private func measureBruteForceOfKey(withBitWidth width: Int) -> ContinuousClock.Instant.Duration {
        let clock = ContinuousClock()
        
        let toMeasure = { [unowned self] in
            let key = self.generatePrime(width)
            var potentialKey: BigInt = 0
            
            while potentialKey != key {
                potentialKey += 1
                print(potentialKey)
            }
        }
        
        let measuredResult = clock.measure(toMeasure)
        
        return measuredResult
    }
    
    private func generatePrime(_ width: Int) -> BigUInt {
        while true {
            var random = BigUInt.randomInteger(withExactWidth: width)
            random |= BigUInt(1)
            if random.isPrime() {
                return random
            }
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /// uncomment any line you you want to measure and comment the current not commented
//        print(measureBruteForceOfKey(withBitWidth: 8))
//        print(measureBruteForceOfKey(withBitWidth: 16))
//        print(measureBruteForceOfKey(withBitWidth: 32))
        print(measureBruteForceOfKey(withBitWidth: 64))
//        print(measureBruteForceOfKey(withBitWidth: 128))
//        print(measureBruteForceOfKey(withBitWidth: 256))
//        print(measureBruteForceOfKey(withBitWidth: 512))
//        print(measureBruteForceOfKey(withBitWidth: 1024))
//        print(measureBruteForceOfKey(withBitWidth: 2048))
//        print(measureBruteForceOfKey(withBitWidth: 4096))
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
