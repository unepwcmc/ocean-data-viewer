module InjectableServices
  def self.included(base)
    base.extend Dependor::Injectable
  end

  def injector
    @injector ||= Injector.new(request)
  end
end
