class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    render 'show.html.erb'
  end

  def index
    @employees = Employee.all
    render 'index.html.erb'
  end

  def create

    @employee = Employee.create(
      first_name: params[:form_first_name],
      last_name: params[:form_last_name],
      email: params[:form_email],
      first_name: params[:form_birthdate]
      )
    redirect_to "/employees/#{@employee.id}"
  end

  def new
    render 'new.html.erb'
  end

  def edit
    @employee = Employee.find(params[:id])
    render 'edit.html.erb'
  end

  def update
    @employee = Employee.find(params['id'])
    p 'employee'
    p @employee.id
    @employee.update(
       :form_first_name => params['form_first_name'],
       :form_last_name => params['form_last_name']
      )
    redirect_to "/employees/#{@employee.id}"
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to "/employees"
  end
end
