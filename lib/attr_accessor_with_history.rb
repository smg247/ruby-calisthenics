class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(value)
        # lazy initialization
        if @history_#{attr_name} == nil then
          @history_#{attr_name} = []
        end
        
        # push the old value onto the history
        @history_#{attr_name}.push(#{attr_name})
        
        # finally actually set the value
        @#{attr_name} = value
      end
      
      def #{attr_name}_history
        return @history_#{attr_name}
      end
    }
  end
end
