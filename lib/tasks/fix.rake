namespace :redmine do
  namespace :custom_fields_encoding_fix do
    task :fix do
      CustomField.find_each do |c_f|
        c_f.possible_values.each { |v| v.force_encoding('UTF-8') }
        c_f.save!
      end

      puts "Fixed"
    end
  end
end
