module Sources
    def self.webservice(name)
        return "#{name}WebService.swift", <<~WEBSERVICE
        import UIKit
        
        class #{name}WebService: #{name}WebServiceInputProtocol {
            var interactor: #{name}WebServiceOutputProtocol?
        }
        WEBSERVICE
    end
end