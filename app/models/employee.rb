class Employee
  attr_accessor :first_name, :last_name, :email, :ssn, :birthdate, :company_email, :id

  def initialize(input_hash)
    @id = input_hash['id']
    @first_name = input_hash['firstName']
    @last_name = input_hash['lastName']
    @company_email = input_hash['company_email']
    @email = input_hash['companyemail']
    @ssn = input_hash['ssn']
    @birthdate = input_hash['birthdate']
  end

  def self.find(input_id)
    employee_hash = Unirest.get("http://localhost:3000/api/v1/employees/#{input_id}.json").body
    Employee.new(employee_hash)
  end

  def self.all
    @employees = []
    employees_hash = Unirest.get("#{ENV['API_BASE_URL']}/employees").body
    employees_hash.each do |employee_hash|
      @employees << Employee.new(employee_hash)
    end
    @employees
  end

  def self.create(input_hash)
    employee_hash = Unirest.post(
      "http://localhost:3000/api/v1/employees",
      headers:{ "Accept" => "application/json" },
      parameters:input_hash
      ).body
    Employee.new(employee_hash)
  end

  def update(input_hash)
    employee_hash = Unirest.patch(
      "http://localhost:3000/api/v1/employees/#{id}",
      headers:{ "Accept" => "application/json" },
      parameters: input_hash
      ).body

  end

  def destroy
    @employee = Unirest.delete("http://localhost:3000/api/v1/employees/#{id}").body
  end
end
