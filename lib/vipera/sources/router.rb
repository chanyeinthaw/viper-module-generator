module Sources
    def self.router(name)
        return "#{name}Router.swift", <<~ROUTER
        import UIKit
        
        class #{name}Router: #{name}RouterProtocol {
            static func createModule() -> UIViewController? {
                let navController = // TODO: Set navController
                
                guard let view = navController?.children.first as? #{name}ViewController else { return nil }
                
                let router: #{name}RouterProtocol = #{name}Router()
                var presenter: #{name}PresenterProtocol & #{name}InteractorOutputProtocol = #{name}Presenter()
                var interactor: #{name}InteractorInputProtocol & #{name}WebServiceOutputProtocol = #{name}Interactor()
                let localStorage: #{name}LocalStorageProtocol = #{name}LocalStorage()
                let webService: #{name}WebServiceInputProtocol = #{name}WebService()

                view.presenter = presenter
                presenter.view = view
                presenter.router = router
                presenter.interactor = interactor
                interactor.presenter = presenter
                interactor.localStorage = localStorage

                return navController
            }
        }
        ROUTER
    end
end