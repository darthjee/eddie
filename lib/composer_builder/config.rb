require 'lib/composer_builder/config/application'

class ComposerBuilder
  class Config
    def initialize(hash)
      @hash = hash
    end

    def active_applications
      applications.select(&:active)
    end

    def applications
      @applications ||= hash.map do |name, settings|
        Application.new(name, settings)
      end
    end

    private

    attr_reader :hash
  end
end
