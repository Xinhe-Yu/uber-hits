class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def validate_field_cannot_have_only_whitespace(field_name, min_length: 3)
    value = send(field_name)
    return unless value.length.positive?

    errors.add(field_name, "cannot consist only of whitespaces") unless value.match?(/\S/)
    errors.add(field_name, "cannot be less than #{min_length} characters") if value.length < 3
  end
end
