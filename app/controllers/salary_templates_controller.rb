class SalaryTemplatesController < AuthorizedController
  def copy
    # Duplicate original record
    template = resource.dup

    # Rebuild salary items
    template.salary_items = resource.salary_items.map{|salary_item| salary_item.dup}
    set_resource_ivar template

    render 'edit'
  end

  # has_many :salary_items
  def new_salary_item
    if salary_template_id = params[:id]
      @salary_template = resource_class.find(salary_template_id)
    else
      @salary_template = resource_class.new
    end

    @salary_item = @salary_template.salary_items.build

    respond_with @salary_item
  end
end
