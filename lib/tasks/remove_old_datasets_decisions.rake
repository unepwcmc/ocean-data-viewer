namespace :datasets_decisions do

  desc 'Remove datasets decisions with dataset_id or decision_id of no longer existing objects'
  task :remove_obsolete => :environment do
    DatasetsDecision.all.each do |dd|
      if Decision.find_by_id(dd.decision_id).nil?
        dd.destroy
      end
      if Dataset.find_by_id(dd.dataset_id).nil?
        dd.destroy
      end
    end
  end

end
