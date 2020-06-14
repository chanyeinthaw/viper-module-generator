module Sources
    def self.interactor(name)
        return "#{name}Interactor.swift", <<~INTERACTOR
        import UIKit
        
        class #{name}Interactor: #{name}InteractorInputProtocol {
            var presenter: #{name}InteractorOutputProtocol?
            var localStorage: #{name}LocalStorageInputProtocol?
            var webService: #{name}WebServiceInputProtocol?
        }
        
        //  MARK: WEB_SERVICE -> INTERACTOR
        extension #{name}Interactor: #{name}WebServiceOutputProtocol {
            
        }
        INTERACTOR
    end
end