namespace :update_labels do

  desc 'Update observation type choices given in pairs [old_name, new_name] or add a new one ['', name]'
  task :data_types => :environment do
    [ ['empirical', 'Empirical observation'],
      ['modelled', 'Model'],
      ['metric', 'Metric'],
      ['classification', 'Classification'],
      ['', 'Other']
      ].each do |names|
        label = ObservationType.where(name: names[0])
        if label.empty?
          ObservationType.find_or_create_by(name: names[1])
        else
          label.update_all(name: names[1])
        end
    end
  end

  desc 'Update data formats choices given in pairs [old_name, new_name] or add a new one ['', name]'
  task :data_formats => :environment do
    [ ['', 'other'] ].each do |names|
      label = DataFormat.where(name: names[0])
      if label.empty?
        DataFormat.find_or_create_by(name: names[1])
      else
        label.update_all(name: names[1])
      end
    end
  end

end
