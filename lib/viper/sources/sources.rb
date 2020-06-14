require 'viper/sources/protocols'
require 'viper/sources/router'
require 'viper/sources/presenter'
require 'viper/sources/interactor'
require 'viper/sources/view'
require 'viper/sources/webservice'
require 'viper/sources/localstorage'

module Sources
    PASCAL_CASE_REGEX = /^[A-Z][a-z]+(?:[A-Z][a-z]+)*$/
    DIRECTORIES = %w[Data Presenter Interactor Protocol Router View]

    def self.create_sources_map(name)
        unless name.match(PASCAL_CASE_REGEX) then return end

        sources_map = {}
        DIRECTORIES.each do |directory|
            case directory
            when "Data"
                web_service = self.webservice(name)
                local_storage = self.localstorage(name)
                sources_map[directory] = {
                    web_service[0] => web_service[1],
                    local_storage[0] => local_storage[1]
                }
            when "Presenter"
                presenter = self.presenter(name)
                sources_map[directory] = {
                    presenter[0] => presenter[1]
                }
            when "Interactor"
                interactor = self.interactor(name)
                sources_map[directory] = {
                    interactor[0] => interactor[1]
                }
            when "Protocol"
                protocols = self.protocols(name)
                sources_map[directory] = {
                    protocols[0] => protocols[1]
                }
            when "Router"
                router = self.router(name)
                sources_map[directory] = {
                    router[0] => router[1]
                }
            else
                view = self.view(name)
                sources_map[directory] = {
                    view[0] => view[1]
                }
            end
        end

        sources_map
    end
end