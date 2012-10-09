namespace :redmine do
  namespace :custom_fields_encoding_fix do
    task :fix do
      Query.find_each do |q|

        q.filters.each do |key, filter|
          filter[:values].each { |v| v.force_encoding('UTF-8') }
        end

        q.save!
      end
    end
  end
end
