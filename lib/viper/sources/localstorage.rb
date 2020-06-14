module Sources
    def self.localstorage(name)
        return "#{name}LocalStorage.swift", <<~LOCALSTORAGE
        import Foundation

        class #{name}LocalStorage: #{name}LocalStorageInputProtocol {
            
        }
        LOCALSTORAGE
    end
end