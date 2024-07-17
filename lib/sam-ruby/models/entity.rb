# frozen_string_literal: true

module SamRuby
  module Models
    class Entity < BaseModel
      # @!attribute [rw] id
      #   The entity's identifier.
      #   @return [String]
      required :id, String

      # @!attribute [rw] corporation
      #   Details of the corporation entity. Will be present if `structure` is equal to `corporation`.
      #   @return [SamRuby::Models::Entity::Corporation]
      required :corporation, -> { SamRuby::Models::Entity::Corporation }

      # @!attribute [rw] created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Entity was created.
      #   @return [String]
      required :created_at, String

      # @!attribute [rw] description
      #   The entity's description for display purposes.
      #   @return [String]
      required :description, String

      # @!attribute [rw] details_confirmed_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Entity's details were most recently confirmed.
      #   @return [String]
      required :details_confirmed_at, String

      # @!attribute [rw] government_authority
      #   Details of the government authority entity. Will be present if `structure` is equal to `government_authority`.
      #   @return [SamRuby::Models::Entity::GovernmentAuthority]
      required :government_authority, -> { SamRuby::Models::Entity::GovernmentAuthority }

      # @!attribute [rw] idempotency_key
      #   The idempotency key you chose for this object. This value is unique across Increase and is used to ensure that a request is only processed once. Learn more about [idempotency](https://increase.com/documentation/idempotency-keys).
      #   @return [String]
      required :idempotency_key, String

      # @!attribute [rw] joint
      #   Details of the joint entity. Will be present if `structure` is equal to `joint`.
      #   @return [SamRuby::Models::Entity::Joint]
      required :joint, -> { SamRuby::Models::Entity::Joint }

      # @!attribute [rw] natural_person
      #   Details of the natural person entity. Will be present if `structure` is equal to `natural_person`.
      #   @return [SamRuby::Models::Entity::NaturalPerson]
      required :natural_person, -> { SamRuby::Models::Entity::NaturalPerson }

      # @!attribute [rw] status
      #   The status of the entity.
      #   @return [Symbol]
      required :status, SamRuby::Enum.new(:active, :archived, :disabled)

      # @!attribute [rw] structure
      #   The entity's legal structure.
      #   @return [Symbol]
      required :structure,
               SamRuby::Enum.new(:corporation, :natural_person, :joint, :trust, :government_authority)

      # @!attribute [rw] supplemental_documents
      #   Additional documentation associated with the entity. This is limited to the first 10 documents for an entity. If an entity has more than 10 documents, use the GET /entity_supplemental_documents list endpoint to retrieve them.
      #   @return [Array<SamRuby::Models::Entity::SupplementalDocument>]
      required :supplemental_documents,
               SamRuby::ArrayOf.new(-> { SamRuby::Models::Entity::SupplementalDocument })

      # @!attribute [rw] trust_
      #   Details of the trust entity. Will be present if `structure` is equal to `trust`.
      #   @return [SamRuby::Models::Entity::Trust]
      required :trust_, -> { SamRuby::Models::Entity::Trust }

      # @!attribute [rw] type
      #   A constant representing the object's type. For this resource it will always be `entity`.
      #   @return [Symbol]
      required :type, SamRuby::Enum.new(:entity)

      class Corporation < BaseModel
        # @!attribute [rw] address
        #   The corporation's address.
        #   @return [SamRuby::Models::Entity::Corporation::Address]
        required :address, -> { SamRuby::Models::Entity::Corporation::Address }

        # @!attribute [rw] beneficial_owners
        #   The identifying details of anyone controlling or owning 25% or more of the corporation.
        #   @return [Array<SamRuby::Models::Entity::Corporation::BeneficialOwner>]
        required :beneficial_owners,
                 SamRuby::ArrayOf.new(-> { SamRuby::Models::Entity::Corporation::BeneficialOwner })

        # @!attribute [rw] incorporation_state
        #   The two-letter United States Postal Service (USPS) abbreviation for the corporation's state of incorporation.
        #   @return [String]
        required :incorporation_state, String

        # @!attribute [rw] industry_code
        #   The numeric North American Industry Classification System (NAICS) code submitted for the corporation.
        #   @return [String]
        required :industry_code, String

        # @!attribute [rw] name_
        #   The legal name of the corporation.
        #   @return [String]
        required :name_, String

        # @!attribute [rw] tax_identifier
        #   The Employer Identification Number (EIN) for the corporation.
        #   @return [String]
        required :tax_identifier, String

        # @!attribute [rw] website
        #   The website of the corporation.
        #   @return [String]
        required :website, String

        class Address < BaseModel
          # @!attribute [rw] city
          #   The city of the address.
          #   @return [String]
          required :city, String

          # @!attribute [rw] line1
          #   The first line of the address.
          #   @return [String]
          required :line1, String

          # @!attribute [rw] line2
          #   The second line of the address.
          #   @return [String]
          required :line2, String

          # @!attribute [rw] state
          #   The two-letter United States Postal Service (USPS) abbreviation for the state of the address.
          #   @return [String]
          required :state, String

          # @!attribute [rw] zip
          #   The ZIP code of the address.
          #   @return [String]
          required :zip, String
        end

        class BeneficialOwner < BaseModel
          # @!attribute [rw] beneficial_owner_id
          #   The identifier of this beneficial owner.
          #   @return [String]
          required :beneficial_owner_id, String

          # @!attribute [rw] company_title
          #   This person's role or title within the entity.
          #   @return [String]
          required :company_title, String

          # @!attribute [rw] individual
          #   Personal details for the beneficial owner.
          #   @return [SamRuby::Models::Entity::Corporation::BeneficialOwner::Individual]
          required :individual, -> { SamRuby::Models::Entity::Corporation::BeneficialOwner::Individual }

          # @!attribute [rw] prong
          #   Why this person is considered a beneficial owner of the entity.
          #   @return [Symbol]
          required :prong, SamRuby::Enum.new(:ownership, :control)

          class Individual < BaseModel
            # @!attribute [rw] address
            #   The person's address.
            #   @return [SamRuby::Models::Entity::Corporation::BeneficialOwner::Individual::Address]
            required :address, -> { SamRuby::Models::Entity::Corporation::BeneficialOwner::Individual::Address }

            # @!attribute [rw] date_of_birth
            #   The person's date of birth in YYYY-MM-DD format.
            #   @return [String]
            required :date_of_birth, String

            # @!attribute [rw] identification
            #   A means of verifying the person's identity.
            #   @return [SamRuby::Models::Entity::Corporation::BeneficialOwner::Individual::Identification]
            required :identification,
                     -> { SamRuby::Models::Entity::Corporation::BeneficialOwner::Individual::Identification }

            # @!attribute [rw] name_
            #   The person's legal name.
            #   @return [String]
            required :name_, String

            class Address < BaseModel
              # @!attribute [rw] city
              #   The city of the address.
              #   @return [String]
              required :city, String

              # @!attribute [rw] line1
              #   The first line of the address.
              #   @return [String]
              required :line1, String

              # @!attribute [rw] line2
              #   The second line of the address.
              #   @return [String]
              required :line2, String

              # @!attribute [rw] state
              #   The two-letter United States Postal Service (USPS) abbreviation for the state of the address.
              #   @return [String]
              required :state, String

              # @!attribute [rw] zip
              #   The ZIP code of the address.
              #   @return [String]
              required :zip, String
            end

            class Identification < BaseModel
              # @!attribute [rw] method_
              #   A method that can be used to verify the individual's identity.
              #   @return [Symbol]
              required :method_,
                       SamRuby::Enum.new(
                         :social_security_number,
                         :individual_taxpayer_identification_number,
                         :passport,
                         :drivers_license,
                         :other
                       )

              # @!attribute [rw] number_last4
              #   The last 4 digits of the identification number that can be used to verify the individual's identity.
              #   @return [String]
              required :number_last4, String
            end
          end
        end
      end

      class GovernmentAuthority < BaseModel
        # @!attribute [rw] address
        #   The government authority's address.
        #   @return [SamRuby::Models::Entity::GovernmentAuthority::Address]
        required :address, -> { SamRuby::Models::Entity::GovernmentAuthority::Address }

        # @!attribute [rw] authorized_persons
        #   The identifying details of authorized persons of the government authority.
        #   @return [Array<SamRuby::Models::Entity::GovernmentAuthority::AuthorizedPerson>]
        required :authorized_persons,
                 SamRuby::ArrayOf.new(-> { SamRuby::Models::Entity::GovernmentAuthority::AuthorizedPerson })

        # @!attribute [rw] category
        #   The category of the government authority.
        #   @return [Symbol]
        required :category, SamRuby::Enum.new(:municipality)

        # @!attribute [rw] name_
        #   The government authority's name.
        #   @return [String]
        required :name_, String

        # @!attribute [rw] tax_identifier
        #   The Employer Identification Number (EIN) of the government authority.
        #   @return [String]
        required :tax_identifier, String

        # @!attribute [rw] website
        #   The government authority's website.
        #   @return [String]
        required :website, String

        class Address < BaseModel
          # @!attribute [rw] city
          #   The city of the address.
          #   @return [String]
          required :city, String

          # @!attribute [rw] line1
          #   The first line of the address.
          #   @return [String]
          required :line1, String

          # @!attribute [rw] line2
          #   The second line of the address.
          #   @return [String]
          required :line2, String

          # @!attribute [rw] state
          #   The two-letter United States Postal Service (USPS) abbreviation for the state of the address.
          #   @return [String]
          required :state, String

          # @!attribute [rw] zip
          #   The ZIP code of the address.
          #   @return [String]
          required :zip, String
        end

        class AuthorizedPerson < BaseModel
          # @!attribute [rw] authorized_person_id
          #   The identifier of this authorized person.
          #   @return [String]
          required :authorized_person_id, String

          # @!attribute [rw] name_
          #   The person's legal name.
          #   @return [String]
          required :name_, String
        end
      end

      class Joint < BaseModel
        # @!attribute [rw] individuals
        #   The two individuals that share control of the entity.
        #   @return [Array<SamRuby::Models::Entity::Joint::Individual>]
        required :individuals, SamRuby::ArrayOf.new(-> { SamRuby::Models::Entity::Joint::Individual })

        # @!attribute [rw] name_
        #   The entity's name.
        #   @return [String]
        required :name_, String

        class Individual < BaseModel
          # @!attribute [rw] address
          #   The person's address.
          #   @return [SamRuby::Models::Entity::Joint::Individual::Address]
          required :address, -> { SamRuby::Models::Entity::Joint::Individual::Address }

          # @!attribute [rw] date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #   @return [String]
          required :date_of_birth, String

          # @!attribute [rw] identification
          #   A means of verifying the person's identity.
          #   @return [SamRuby::Models::Entity::Joint::Individual::Identification]
          required :identification, -> { SamRuby::Models::Entity::Joint::Individual::Identification }

          # @!attribute [rw] name_
          #   The person's legal name.
          #   @return [String]
          required :name_, String

          class Address < BaseModel
            # @!attribute [rw] city
            #   The city of the address.
            #   @return [String]
            required :city, String

            # @!attribute [rw] line1
            #   The first line of the address.
            #   @return [String]
            required :line1, String

            # @!attribute [rw] line2
            #   The second line of the address.
            #   @return [String]
            required :line2, String

            # @!attribute [rw] state
            #   The two-letter United States Postal Service (USPS) abbreviation for the state of the address.
            #   @return [String]
            required :state, String

            # @!attribute [rw] zip
            #   The ZIP code of the address.
            #   @return [String]
            required :zip, String
          end

          class Identification < BaseModel
            # @!attribute [rw] method_
            #   A method that can be used to verify the individual's identity.
            #   @return [Symbol]
            required :method_,
                     SamRuby::Enum.new(
                       :social_security_number,
                       :individual_taxpayer_identification_number,
                       :passport,
                       :drivers_license,
                       :other
                     )

            # @!attribute [rw] number_last4
            #   The last 4 digits of the identification number that can be used to verify the individual's identity.
            #   @return [String]
            required :number_last4, String
          end
        end
      end

      class NaturalPerson < BaseModel
        # @!attribute [rw] address
        #   The person's address.
        #   @return [SamRuby::Models::Entity::NaturalPerson::Address]
        required :address, -> { SamRuby::Models::Entity::NaturalPerson::Address }

        # @!attribute [rw] date_of_birth
        #   The person's date of birth in YYYY-MM-DD format.
        #   @return [String]
        required :date_of_birth, String

        # @!attribute [rw] identification
        #   A means of verifying the person's identity.
        #   @return [SamRuby::Models::Entity::NaturalPerson::Identification]
        required :identification, -> { SamRuby::Models::Entity::NaturalPerson::Identification }

        # @!attribute [rw] name_
        #   The person's legal name.
        #   @return [String]
        required :name_, String

        class Address < BaseModel
          # @!attribute [rw] city
          #   The city of the address.
          #   @return [String]
          required :city, String

          # @!attribute [rw] line1
          #   The first line of the address.
          #   @return [String]
          required :line1, String

          # @!attribute [rw] line2
          #   The second line of the address.
          #   @return [String]
          required :line2, String

          # @!attribute [rw] state
          #   The two-letter United States Postal Service (USPS) abbreviation for the state of the address.
          #   @return [String]
          required :state, String

          # @!attribute [rw] zip
          #   The ZIP code of the address.
          #   @return [String]
          required :zip, String
        end

        class Identification < BaseModel
          # @!attribute [rw] method_
          #   A method that can be used to verify the individual's identity.
          #   @return [Symbol]
          required :method_,
                   SamRuby::Enum.new(
                     :social_security_number,
                     :individual_taxpayer_identification_number,
                     :passport,
                     :drivers_license,
                     :other
                   )

          # @!attribute [rw] number_last4
          #   The last 4 digits of the identification number that can be used to verify the individual's identity.
          #   @return [String]
          required :number_last4, String
        end
      end

      class SupplementalDocument < BaseModel
        # @!attribute [rw] created_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Supplemental Document was created.
        #   @return [String]
        required :created_at, String

        # @!attribute [rw] file_id
        #   The File containing the document.
        #   @return [String]
        required :file_id, String

        # @!attribute [rw] idempotency_key
        #   The idempotency key you chose for this object. This value is unique across Increase and is used to ensure that a request is only processed once. Learn more about [idempotency](https://increase.com/documentation/idempotency-keys).
        #   @return [String]
        required :idempotency_key, String

        # @!attribute [rw] type
        #   A constant representing the object's type. For this resource it will always be `entity_supplemental_document`.
        #   @return [Symbol]
        required :type, SamRuby::Enum.new(:entity_supplemental_document)
      end

      class Trust < BaseModel
        # @!attribute [rw] address
        #   The trust's address.
        #   @return [SamRuby::Models::Entity::Trust::Address]
        required :address, -> { SamRuby::Models::Entity::Trust::Address }

        # @!attribute [rw] category
        #   Whether the trust is `revocable` or `irrevocable`.
        #   @return [Symbol]
        required :category, SamRuby::Enum.new(:revocable, :irrevocable)

        # @!attribute [rw] formation_document_file_id
        #   The ID for the File containing the formation document of the trust.
        #   @return [String]
        required :formation_document_file_id, String

        # @!attribute [rw] formation_state
        #   The two-letter United States Postal Service (USPS) abbreviation for the state in which the trust was formed.
        #   @return [String]
        required :formation_state, String

        # @!attribute [rw] grantor
        #   The grantor of the trust. Will be present if the `category` is `revocable`.
        #   @return [SamRuby::Models::Entity::Trust::Grantor]
        required :grantor, -> { SamRuby::Models::Entity::Trust::Grantor }

        # @!attribute [rw] name_
        #   The trust's name.
        #   @return [String]
        required :name_, String

        # @!attribute [rw] tax_identifier
        #   The Employer Identification Number (EIN) of the trust itself.
        #   @return [String]
        required :tax_identifier, String

        # @!attribute [rw] trustees
        #   The trustees of the trust.
        #   @return [Array<SamRuby::Models::Entity::Trust::Trustee>]
        required :trustees, SamRuby::ArrayOf.new(-> { SamRuby::Models::Entity::Trust::Trustee })

        class Address < BaseModel
          # @!attribute [rw] city
          #   The city of the address.
          #   @return [String]
          required :city, String

          # @!attribute [rw] line1
          #   The first line of the address.
          #   @return [String]
          required :line1, String

          # @!attribute [rw] line2
          #   The second line of the address.
          #   @return [String]
          required :line2, String

          # @!attribute [rw] state
          #   The two-letter United States Postal Service (USPS) abbreviation for the state of the address.
          #   @return [String]
          required :state, String

          # @!attribute [rw] zip
          #   The ZIP code of the address.
          #   @return [String]
          required :zip, String
        end

        class Grantor < BaseModel
          # @!attribute [rw] address
          #   The person's address.
          #   @return [SamRuby::Models::Entity::Trust::Grantor::Address]
          required :address, -> { SamRuby::Models::Entity::Trust::Grantor::Address }

          # @!attribute [rw] date_of_birth
          #   The person's date of birth in YYYY-MM-DD format.
          #   @return [String]
          required :date_of_birth, String

          # @!attribute [rw] identification
          #   A means of verifying the person's identity.
          #   @return [SamRuby::Models::Entity::Trust::Grantor::Identification]
          required :identification, -> { SamRuby::Models::Entity::Trust::Grantor::Identification }

          # @!attribute [rw] name_
          #   The person's legal name.
          #   @return [String]
          required :name_, String

          class Address < BaseModel
            # @!attribute [rw] city
            #   The city of the address.
            #   @return [String]
            required :city, String

            # @!attribute [rw] line1
            #   The first line of the address.
            #   @return [String]
            required :line1, String

            # @!attribute [rw] line2
            #   The second line of the address.
            #   @return [String]
            required :line2, String

            # @!attribute [rw] state
            #   The two-letter United States Postal Service (USPS) abbreviation for the state of the address.
            #   @return [String]
            required :state, String

            # @!attribute [rw] zip
            #   The ZIP code of the address.
            #   @return [String]
            required :zip, String
          end

          class Identification < BaseModel
            # @!attribute [rw] method_
            #   A method that can be used to verify the individual's identity.
            #   @return [Symbol]
            required :method_,
                     SamRuby::Enum.new(
                       :social_security_number,
                       :individual_taxpayer_identification_number,
                       :passport,
                       :drivers_license,
                       :other
                     )

            # @!attribute [rw] number_last4
            #   The last 4 digits of the identification number that can be used to verify the individual's identity.
            #   @return [String]
            required :number_last4, String
          end
        end

        class Trustee < BaseModel
          # @!attribute [rw] individual
          #   The individual trustee of the trust. Will be present if the trustee's `structure` is equal to `individual`.
          #   @return [SamRuby::Models::Entity::Trust::Trustee::Individual]
          required :individual, -> { SamRuby::Models::Entity::Trust::Trustee::Individual }

          # @!attribute [rw] structure
          #   The structure of the trustee. Will always be equal to `individual`.
          #   @return [Symbol]
          required :structure, SamRuby::Enum.new(:individual)

          class Individual < BaseModel
            # @!attribute [rw] address
            #   The person's address.
            #   @return [SamRuby::Models::Entity::Trust::Trustee::Individual::Address]
            required :address, -> { SamRuby::Models::Entity::Trust::Trustee::Individual::Address }

            # @!attribute [rw] date_of_birth
            #   The person's date of birth in YYYY-MM-DD format.
            #   @return [String]
            required :date_of_birth, String

            # @!attribute [rw] identification
            #   A means of verifying the person's identity.
            #   @return [SamRuby::Models::Entity::Trust::Trustee::Individual::Identification]
            required :identification, -> { SamRuby::Models::Entity::Trust::Trustee::Individual::Identification }

            # @!attribute [rw] name_
            #   The person's legal name.
            #   @return [String]
            required :name_, String

            class Address < BaseModel
              # @!attribute [rw] city
              #   The city of the address.
              #   @return [String]
              required :city, String

              # @!attribute [rw] line1
              #   The first line of the address.
              #   @return [String]
              required :line1, String

              # @!attribute [rw] line2
              #   The second line of the address.
              #   @return [String]
              required :line2, String

              # @!attribute [rw] state
              #   The two-letter United States Postal Service (USPS) abbreviation for the state of the address.
              #   @return [String]
              required :state, String

              # @!attribute [rw] zip
              #   The ZIP code of the address.
              #   @return [String]
              required :zip, String
            end

            class Identification < BaseModel
              # @!attribute [rw] method_
              #   A method that can be used to verify the individual's identity.
              #   @return [Symbol]
              required :method_,
                       SamRuby::Enum.new(
                         :social_security_number,
                         :individual_taxpayer_identification_number,
                         :passport,
                         :drivers_license,
                         :other
                       )

              # @!attribute [rw] number_last4
              #   The last 4 digits of the identification number that can be used to verify the individual's identity.
              #   @return [String]
              required :number_last4, String
            end
          end
        end
      end
    end
  end
end
