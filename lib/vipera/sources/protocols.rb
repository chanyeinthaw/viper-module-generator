module Sources
    def self.protocols(name)
        return "#{name}Protocols.swift", <<~PROTOCOLS
        import UIKit
        
        protocol #{name}ViewProtocol {
            var presenter: #{name}PresenterProtocol? { get set }
            
            // PRESENTER -> VIEW
        }

        protocol #{name}PresenterProtocol {
            var view: #{name}ViewProtocol? { get set }
            var interactor: #{name}InteractorInputProtocol? { get set }
            var router: #{name}RouterProtocol? { get set }
            
            // VIEW -> PRESENTER
        }
        
        protocol #{name}InteractorInputProtocol {
            var presenter: #{name}InteractorOutputProtocol? { get set }
            var localStorage: #{name}LocalStorageInputProtocol? { get set }
            var webService: #{name}WebServiceInputProtocol? { get set }
            
            // PRESENTER -> INTERACTOR
        }
        
        protocol #{name}InteractorOutputProtocol {
            // INTERACTOR -> PRESENTER
        }
        
        protocol #{name}RouterProtocol {
            // PRESENTER -> ROUTER
            static func createModule() -> UIViewController?
        }
        
        protocol #{name}LocalStorageInputProtocol {
            // INTERACTOR -> LOCALSTORAGE
        }
        
        protocol #{name}WebServiceInputProtocol {
            var interactor: #{name}WebServiceOutputProtocol? { get set }
            
            // INTERACTOR -> WEBSERVICE
        }
        
        protocol #{name}WebServiceOutputProtocol {
            // WEBSERVICE -> INTERACTOR
        }
        PROTOCOLS
    end
end

