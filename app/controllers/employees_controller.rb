class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        if !(Employee.get_titles.include?(employee_params[:title]))
            @employee = Employee.new(employee_params)
            @employee.save
            redirect_to employee_path(@employee)
        else
            redirect_to employees_path
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        if !(Employee.get_titles.include?(employee_params[:title]))
            @employee = Employee.new(employee_params)
            @employee.save
            redirect_to employee_path(@employee)
        else
            redirect_to employees_path
        end
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end

end
