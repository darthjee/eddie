class Container
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.from(type, application)
    new(
      [application.name,type].join('-')
    )
  end
end
