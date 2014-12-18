<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_and_authorize_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  after_filter :verify_authorized,  except: :index
  after_filter :verify_policy_scoped, only: :index

  def index
    @<%= plural_table_name %> = policy_scope(<%= orm_class.all(class_name) %>)
    fresh_when etag: [I18n.locale, current_user, cache_key_for_all(<%= singular_table_name.classify %>)]
  end

  def show
    fresh_when etag: [I18n.locale, current_user, @<%= singular_table_name %>]
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    authorize @<%= singular_table_name %>, :new?
  end

  def edit
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    authorize @<%= singular_table_name %>, :create?

    if @<%= orm_instance.save %>
      redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %>
    else
      render :new
    end
  end

  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %>
    else
      render :edit
    end
  end

  def destroy
    @<%= orm_instance.destroy %>
    redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %>
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_<%= singular_table_name %>
      <% if attributes.map(&:name).include? 'slug' -%>
@<%= singular_table_name %> = <%= "#{orm_class.find(class_name, "params[:id]").gsub(/.find/, '.friendly.find')}" %>
      <% else -%>
@<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
      <% end -%>
authorize @<%= singular_table_name %>, "#{action_name}?".to_sym
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[:<%= singular_table_name %>]
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.reject { |name| ['slug'].include?(name) }.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end
<% end -%>
