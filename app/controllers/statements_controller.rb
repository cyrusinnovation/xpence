class StatementsController < ApplicationController
  load_and_authorize_resource

  def show
    @statement = Statement.find(params[:id])
    @grouped_expenses = @statement.expenses.group_by(&:employee)
    respond_to do |format|
      format.csv { send_data @statement.to_csv }
    end
  end

  def new
    @statement = Statement.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @statement = Statement.find(params[:id])
  end

  def create
    @statement = Statement.new(params[:statement])
    result = @statement.save
    @statement.parse_raw_statement
    respond_to do |format|
      if result
        format.html { redirect_to @statement, notice: 'Statement was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @statement = Statement.find(params[:id])

    respond_to do |format|
      if @statement.update_attributes(params[:statement])
        format.html { redirect_to @statement, notice: 'Statement was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def remind
    @statement = Statement.find(params[:id])
    @employees = @statement.employees_with_incomplete
    
    @employees.each do |employee|
      EmployeeMailer.reminder_email(:employee => employee, :statement => @statement).deliver
    end
    
    redirect_to(@statement, :notice => 'Reminder Emails Sent')
  end

  def destroy
    @statement = Statement.find(params[:id])
    @statement.destroy

    respond_to do |format|
      format.html { redirect_to statements_url }
    end
  end
end
