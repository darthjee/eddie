class ComposerBuilder
  class Config
    class Application
      def initialize(name, hash)
        @name = name
        @active = hash['active']
        @local = hash['local']
      end

      attr_reader :name, :active, :local
    end
  end
end
