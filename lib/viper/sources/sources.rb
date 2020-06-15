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
        unless name.match(PASCAL_CASE_REGEX) then raise "Invalid module name!" end

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

    def self.generate_sources(name, xcodeproj, config, source_map)
        target_path = "#{Dir.pwd}/#{config["module-root"]}/#{name}/"
        if File.exists? target_path then raise "Module already exists!" end

        # get target group from config
        group_path = config["module-root"].split '/'
        target_group = nil

        group_path.each do |group_name|
            if target_group == nil
                filters = xcodeproj.groups.filter { |gp| gp.display_name == group_name }
                if filters.count >= 1 then target_group = filters[0] else raise "Target group not found!" end
            else
                filters = target_group.groups.filter { |gp| gp.display_name == group_name }

                if filters.count >= 1 then target_group = filters[0] else raise "Target group not found!" end
            end
        end

        target_group = target_group.new_group(name, target_path)
        Dir.mkdir target_path
        source_map.each_key { |key_path|
            key_full_path = target_path + key_path + "/"
            key_group = target_group.new_group(key_path, key_full_path)

            Dir.mkdir key_full_path

            source_map[key_path].each_key { |file_name|
                file_path = key_full_path + file_name
                content = source_map[key_path][file_name]

                File.write file_path, content

                key_group.new_file file_name
            }
        }

        target_path
    end
end