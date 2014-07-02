require 'net/http'
require 'fileutils'

namespace :download do
  task pdfs: :environment do
    Net::HTTP.start("marine-portal.s3.amazonaws.com") do |http|
      Dataset.all.each do |dataset|
        url = "/resources/datasets/factsheets/#{dataset.id}/original_#{dataset.factsheet_file_name}"
        resp = http.get(url)

        if resp.code == '200'
          puts "donwloading #{dataset.factsheet_file_name}"
          destination_directory = "#{Rails.root}/public/pdfs/#{dataset.id}/"
          FileUtils.mkdir_p(destination_directory)
          open("#{destination_directory}#{dataset.factsheet_file_name}", "wb") do |file|
            file.write(resp.body)
          end
        else
          puts "could not find file #{dataset.factsheet_file_name} at #{url}"
        end
      end
    end
  end
end
