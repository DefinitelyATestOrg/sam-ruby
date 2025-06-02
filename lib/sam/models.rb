# frozen_string_literal: true

module Sam
  [Sam::Internal::Type::BaseModel, *Sam::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Sam::Internal::AnyHash) } }
  end

  Sam::Internal::Util.walk_namespaces(Sam::Models).each do |mod|
    case mod
    in Sam::Internal::Type::Enum | Sam::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Sam::Internal::Util.walk_namespaces(Sam::Models)
                     .lazy
                     .grep(Sam::Internal::Type::Union)
                     .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  CompleteCreateParams = Sam::Models::CompleteCreateParams

  MessageCountTokensBetaParams = Sam::Models::MessageCountTokensBetaParams

  MessageCountTokensParams = Sam::Models::MessageCountTokensParams

  MessageCreateParams = Sam::Models::MessageCreateParams

  Messages = Sam::Models::Messages

  MessagesBetaTrueCreateParams = Sam::Models::MessagesBetaTrueCreateParams

  ModelListParams = Sam::Models::ModelListParams

  ModelRetrieveBetaParams = Sam::Models::ModelRetrieveBetaParams

  ModelRetrieveParams = Sam::Models::ModelRetrieveParams

  ModelsBetaTrueListParams = Sam::Models::ModelsBetaTrueListParams
end
