class ExpensesController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => [:index,:autocomplete_employee_name] 

  after_filter :check_complete, :only => :update

  autocomplete :employee, :name, :full => true, :display_value => :capitalize_name

  # GET /expenses
  # GET /expenses.json
  def index
    @employee = Employee.find_by_name(params[:employee_name])
    if can? :read, @employee.expenses.first
      expenses = @employee.expenses.group_by(&:statement_id)
      @expenses = expenses.each do |date, expenses|
                    expenses.sort_by!{|expense| expense.date}
                  end
    else
      flash[:notice] = "NOT ALLOWED TO VIEW OTHERS' EXPENSES"
      redirect_to named_employee_expenses_path(current_user.name)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id]) 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = Expense.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(params[:expense])

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    # debugger
    @expense = Expense.find(params[:id])

    if @expense.update_attributes(params[:expense])
      render :json => @expense
    else
      render text: @expense.errors.full_messages.to_sentence, status: :unprocessable_entity
      # render :text => @expense.errors.full_messages.to_sentence, :status => :unprocessable_entity 
    end

    # respond_to do |format|
    #   if @expense.update_attributes!(params[:expense])
    #     format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render :json => { :errors => @expense.errors.full_messages }, :status => :unprocessable_entity }
    #   end
    # end
  end

  def reset
    @expense = Expense.find(params[:id])

    @expense.tap do |expense|
      expense.receipt_sent = false
      expense.description = nil
      expense.client = nil
      expense.splits = nil
      expense.complete = false
      expense.save
    end

    render :json => @expense

  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :no_content }
    end
  end

  private 

  def check_complete
    @expense.complete = true if @expense.has_all_info?
    @expense.save
  end
end
