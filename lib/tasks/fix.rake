namespace :redmine do
  namespace :custom_fields_encoding_fix do
    task :fix do
      CustomField.find_each do |c_f|
        c_f.possible_values.each { |v| v.force_encoding('UTF-8') }
        c_f.save!
      end

      Query.find_each do |q|
        q.filters.each do |key, filter|
          filter[:values].each { |v| v.force_encoding('UTF-8') }
        end

        q.save!
      end

      puts "Fixed."
    end
  end
end
