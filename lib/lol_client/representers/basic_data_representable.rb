class LolClient
  module BasicDataRepresentable
    def from_json(*args, &block)
      super

      represented.data.each_pair do |_, value|
        assign_base_attributes(value, represented.basic)
      end
    end

    private

    def assign_base_attributes(obj, base)
      obj.class.defined_attributes.each do |attr|
        obj_value = obj.public_send(attr)
        base_value = base.public_send(attr)

        if base_value.is_a?(ModelBase) && obj_value.is_a?(ModelBase)
          assign_base_attributes(obj_value, base_value)
        elsif obj_value.nil?
          obj.public_send("#{attr}=", (base_value.dup rescue base_value))
        end
      end
    end
  end
end
