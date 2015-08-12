class StudentsController < ApplicationController

  def index
    @students = Student.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
  end

  def show
    @students = Student.find(params[:id])
  end

  def new
    @students = Student.new
  end

  def edit
    @students = Student.find(params[:id])
  end

  def create
    @students = Student.new(students_params)

    if @students.save
      redirect_to @students
    else
      render 'new'
    end
  end

  def update
    @students = Student.find(params[:id])

    if @students.update(students_params)
      redirect_to @students
    else
      render 'edit'
    end
  end

  def destroy
    @students = Student.find(params[:id])
    @students.destroy

    redirect_to students_path
  end

  private
  def students_params
    params.require(:student).permit(:FirstName, :LastName, :Sex, :Address1, :Address2, :Town, :County, :PostCode, :MainNumber, :Course, :Tutor)
  end

  end