class ExpensesController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => [:index,:autocomplete_employee_name] 

  after_filter :check_complete, :only => :update

  autocomplete :employee, :name, :full => true, :display_value => :capitalize_name

  def index
    @employee = Employee.find_by_name(params[:employee_name])
    if can? :read, @employee.expenses.first
      expenses = @employee.expenses.group_by(&:statement_id)
      @expenses = expenses.each do |date, charges|
                    charges.sort_by!{|charge| charge.date}
                  end
    else
      flash[:notice] = "NOT ALLOWED TO VIEW OTHERS' EXPENSES"
      redirect_to named_employee_expenses_path(current_user.name)
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update_attributes(params[:expense])
      render :json => @expense
    else
      render text: @expense.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  def reset
    @expense = Expense.find(params[:id])

    @expense.reset

    render :json => @expense

  end

  def lock
    @expense = Expense.find(params[:id])
    @expense.check_and_set_complete

    render :json => @expense
  end

  private 

  def check_complete
    @expense.complete = true if @expense.has_all_info?
    @expense.save
  end
end
