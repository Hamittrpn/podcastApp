//
//  AppContainer.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 11.12.2024.
//

import Foundation
import Swinject
import os.log

final class AppContainer {
    static let shared = AppContainer()
    private let container : Container
    private let logger: OSLog
    
    private init() {
        container = Container()
        logger = OSLog(subsystem: "podcastApp", category: "AppContainer")
        registerDependencies()
    }
    
    /// NetworkManager instance
    var network: NetworkManager {
        guard let instance = container.resolve(NetworkManager.self) else {
            os_log(.error, log: logger, "NetworkManager could not be resolved")
            fatalError("NetworkManager could not be resolved")
        }
        return instance
    }
    
    /// RealmDatabase instance
    var database: RealmDatabase {
        guard let instance = container.resolve(RealmDatabase.self) else {
            os_log(.error, log: logger, "RealmDatabase could not be resolved")
            fatalError("RealmDatabase could not be resolved")
        }
        return instance
    }
    
    /// DataPublisher instance
    var dataPublisher: DataPublisher {
        guard let instance = container.resolve(DataPublisher.self) else {
            os_log(.error, log: logger, "DataPublisher could not be resolved")
            fatalError("DataPublisher could not be resolved")
        }
        return instance
    }
    
    private func registerDependencies() {
        os_log(.info, log: logger, "Registering dependencies")
        container.register(NetworkManager.self) { _ in NetworkManager(config: NetworkConfig(baseUrl: "https://api.example.com"))}
        container.register(RealmDatabase.self) { _ in RealmDatabase()}
        container.register(DataPublisher.self) { _ in DataPublisher()}
    }
}
