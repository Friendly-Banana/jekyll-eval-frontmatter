module EvalGenerator
  class Generator < Jekyll::Generator
    safe false
    priority :normal

    EvalPattern = /eval\((.*)\)/

    def generate(site)
      site.pages.each do |page|
        page.data.each do |key, value|
          if value.is_a?(String) && value.match?(EvalPattern)
            # Extract the variable name from the key
            variable_name = value[EvalPattern, 1]

            # Evaluate the variable and insert its value
            if defined?(variable_name)
              if variable_name == nil
                raise "Variable #{variable_name} is nil"
              end
              v = eval(variable_name)
              page.data[key] = value.gsub(EvalPattern, v)
            end
          end
        end
      end
    end
  end
end