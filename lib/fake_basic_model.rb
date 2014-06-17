module FakeBasicModel
  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      attr_accessor :id, :name
      include Dependor::Constructor(:id, :name)
    end
  end

  module ClassMethods
    def all
      allowed_values.map do |value|
        new(value, value)
      end
    end
  end
end
