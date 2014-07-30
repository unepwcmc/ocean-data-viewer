namespace :setup do
  task layer_colors: :environment do
    color_mappings = {
      21 => '#734c00',
      22 => '#a8a800',
      13 => '#FFAA00',
      14 => '#A900E6',
      6 => '#267300',
      7 => '#55FF00',
      8 => '#E6E600',
      11 => '#66CC99',
      9 => '#CD6666',
      10 => '#A80000',
      1 => '#CC66CC',
      17 => '#99B3CC',
      16 => '#E1E73D',
      15 => '#399CF0',
      4 => '#98B285',
      5 => '#B9C47A',
      3 => '#B3C1D1',
      19 => '#109489',
      28 => '#ecd906',
      27 => '#43c2d9',
      26 => '#5c83c4',
      29 => '#ff0000',
      30 => '#59c3e2'
    }

    color_mappings.each do |dataset_id, color|
      dataset = Dataset.where(id: dataset_id).first
      if dataset
        puts "set the color #{color} to layer #{dataset_id}"
        dataset.update_attributes!(layer_color: color)
      end
    end
  end
end
