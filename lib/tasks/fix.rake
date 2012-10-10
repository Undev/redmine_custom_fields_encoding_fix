namespace :redmine do
  namespace :custom_fields_encoding_fix do
    task :fix => :environment do
      Query.find_each do |q|

        q.filters.each do |key, filter|
          filter[:values].each do |value|
            value.force_encoding("UTF-8")
          end

          q.filters[key] = filter.dup
        end

        q.save!
      end

      Query.find_each do |q|
        q.filters.each do |key, filter|
          filter[:operator] = filter[:operator].to_s
          q.filters[key] = filter.dup
        end

        q.save!
      end
    end
  end
end
