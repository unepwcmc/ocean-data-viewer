module MemoizeServices
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def service(name, &block)
      define_method("_#{name}", block)

      define_method(name) do
        unless instance_variable_get("@#{name}")
          instance_variable_set("@#{name}", send("_#{name}"))
        end
        instance_variable_get("@#{name}")
      end
    end
  end
end
