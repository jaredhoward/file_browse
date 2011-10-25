require "rails"
module FileBrowse
  class Engine < ::Rails::Engine
    engine_name :file_browse

    config.file_browser_starting_folder = Rails.root

    initializer "check starting folder to be readable" do |app|
      puts "FileBrowse can't read the starting folder" unless File.readable?(config.file_browser_starting_folder)
    end
  end
end