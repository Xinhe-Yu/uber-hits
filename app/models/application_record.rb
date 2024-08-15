class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def validate_field_cannot_have_only_whitespace(field_name, min_length: 3)
    value = send(field_name)
    return unless value.length.positive?

    errors.add(field_name, "cannot consist only of whitespaces") unless value.match?(/\S/)
    errors.add(field_name, "cannot be less than #{min_length} characters") if value.length < 3
  end

  def date_cannot_be_too_late(field_name, ante_quem: Time.current, message: nil)
    value = send(field_name)
    errors.add(field_name, message || "can't after #{ante_quem}") if value > ante_quem
  end

  def date_cannot_be_too_early(field_name, post_quem: Time.current, message: nil)
    value = send(field_name)
    errors.add(field_name, message || "can't before #{post_quem}") if value < post_quem
  end
end
