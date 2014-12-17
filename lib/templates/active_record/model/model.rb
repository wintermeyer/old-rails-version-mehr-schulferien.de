<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
<% if attributes.map(&:name).include? 'slug' -%>
<% if attributes.map(&:name).include? 'name' -%>
  extend FriendlyId
  friendly_id :name, use: :slugged

<% else -%>
  # extend FriendlyId
  # friendly_id :name, use: :slugged

<% end -%>
<% end -%>
  # Associations
  #
<% attributes.select(&:reference?).each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %><%= ', required: true' if attribute.required? %>
<% end -%>
<% if attributes.any?(&:password_digest?) -%>
  has_secure_password
<% end -%>
<% if attributes.map(&:name).include? 'position' -%>
  acts_as_list

<% end -%>

  # Validations
  #
<% attributes.each do |attribute| -%>
<% unless attribute.name.include? 'slug' -%>
  validates :<%= attribute.name %>,
<% if attribute.name.include? '_id' -%>
            numericality: { only_integer: true },
<% end -%>
            presence: true

<% end -%>
<% end -%>

<% if attributes.map(&:name).include? 'name' -%>
  def to_s
    name.to_s
  end
<% else -%>
<% if attributes.map(&:name).include? 'value' %>
  def to_s
    value.to_s
  end
<% end -%>
<% end -%>

end
<% end -%>
