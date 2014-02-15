require 'set'

class LolClient
  class ModelBase
    # Instantiates a new model instance.
    #
    # @param attributes [Hash] attributes to initialize on this model.
    def initialize(attributes = {})
      attributes.each do |key, value|
        public_send("#{key}=", value)
      end
    end

    # Checks if another object is equal to this object.
    #
    # @param obj [Object] an object to compare against.
    # @return [TrueClass, FalseClass] whether or not the objects are equivalent.
    def ==(obj)
      obj.class == self.class && self.class.defined_attributes.all? { |attr| obj.public_send(attr) == public_send(attr) }
    end

    protected

    def self.attributes(*attrs)
      options = attrs.last.is_a?(Hash) ? attrs.pop : {}

      attrs.each { |attr| defined_attributes << attr }

      attr_accessor *attrs

      if options[:boolean]
        attrs.each { |attr| alias_method :"#{attr}?", attr }
      end
    end

    private

    def self.defined_attributes
      @defined_attributes ||= Set.new
    end
  end
end
