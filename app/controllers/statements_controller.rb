class StatementsController < ApplicationController
  # GET /statements
  # GET /statements.json
  load_and_authorize_resource

  def index
    @statements = Statement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statements }
    end
  end

  # GET /statements/1
  # GET /statements/1.json
  def show
    @statement = Statement.find(params[:id])
    @grouped_expenses = @statement.expenses.group_by(&:employee)
    respond_to do |format|
      format.html # show.html.erb
      format.csv { send_data @statement.to_csv }
      format.json { render json: @statement }
    end
  end

  # GET /statements/new
  # GET /statements/new.json
  def new
    @statement = Statement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statement }
    end
  end

  # GET /statements/1/edit
  def edit
    @statement = Statement.find(params[:id])
  end

  # POST /statements
  # POST /statements.json
  def create
    @statement = Statement.new(params[:statement])
    result = @statement.save
    @statement.parse_raw_statement
    respond_to do |format|
      if result
        format.html { redirect_to @statement, notice: 'Statement was successfully created.' }
        format.json { render json: @statement, status: :created, location: @statement }
      else
        format.html { render action: "new" }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statements/1
  # PUT /statements/1.json
  def update
    @statement = Statement.find(params[:id])

    respond_to do |format|
      if @statement.update_attributes(params[:statement])
        format.html { redirect_to @statement, notice: 'Statement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
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

  # DELETE /statements/1
  # DELETE /statements/1.json
  def destroy
    @statement = Statement.find(params[:id])
    @statement.destroy

    respond_to do |format|
      format.html { redirect_to statements_url }
      format.json { head :no_content }
    end
  end
end
