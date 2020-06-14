module Sources
    def self.view(name)
        return "#{name}ViewController.swift", <<~VIEW
        import UIKit
        
        class #{name}ViewController: UIViewController {
            var presenter: #{name}InteractorOutputProtocol?
            var localStorage: #{name}LocalStorageInputProtocol?
            var webService: #{name}WebServiceInputProtocol?
        }

        //  MARK: PRESENTER -> VIEW
        extension #{name}ViewController: #{name}ViewProtocol {
            
        }
        

        VIEW
    end
end