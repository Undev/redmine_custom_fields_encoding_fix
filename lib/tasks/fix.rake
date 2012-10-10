namespace :redmine do
  namespace :custom_fields_encoding_fix do
    task :fix do
      Query.all(true).each do |q|

        q.filters.each do |key, filter|
          filter[:values].each do |value|
            value.force_encoding("UTF-8")
          end

          q.filters[key] = filter.dup
        end

        q.save!
      end

      Query.all(true).each do |q|
        q.filters.each_value do |v|
          v[:operator] = v[:operator].to_s
        end

        q.save!
      end
    end
  end
end
