module SimpleForm
  module Inputs
    class CollectionInput
      def collection_with_lite_enum
        @collection ||= begin
          if options[:collection] &&
             options[:collection].is_a?(LiteEnum) &&
             (translated = translate_from_namespace(:options))

            options.delete(:collection).map do |k, v|
              if translated[k].is_a?(Hash)
                [translated[k][:short], v, translated[k][:long]]
              else
                [translated[k], v]
              end
            end
          else
            collection_without_lite_enum
          end
        end
      end

      alias_method_chain :collection, :lite_enum
    end
  end
end
