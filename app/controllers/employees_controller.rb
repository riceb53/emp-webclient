class EmployeesController < ApplicationController
  def show
    @employee = Unirest.get("http://localhost:3000/api/v1/employees/#{params[:id]}.json").body
    render 'show.html.erb'
  end

  def index
    @employees = Unirest.get("http://localhost:3000/api/v1/employees").body
    render 'index.html.erb'
  end

  def create
    @employee = Unirest.post(
      "http://localhost:3000/api/v1/employees",
      headers:{ "Accept" => "application/json" },
      parameters:{ :form_first_name => params[:form_first_name], :form_last_name => params[:form_last_name] }
      ).body

    redirect_to "/employees/#{@employee["id"]}"
  end

  def new
    render 'new.html.erb'
  end

  def edit
    @employee = Unirest.get("http://localhost:3000/api/v1/employees/#{params[:id]}.json").body
    render 'edit.html.erb'
  end

  def update
    @employee = Unirest.patch(
      "http://localhost:3000/api/v1/employees/#{params[:id]}",
      headers:{ "Accept" => "application/json" },
      parameters:{ :form_first_name => params[:form_first_name], :form_last_name => params[:form_last_name] }
      ).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def destroy
    @employee = Unirest.delete("http://localhost:3000/api/v1/employees/#{params[:id]}").body

    redirect_to "/employees"
  end
end
