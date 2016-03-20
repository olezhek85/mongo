class PeopleController < ApplicationController
  before_action :set_person, only: [:edit, :update, :destroy]


  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'The person has been created!' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
  end

  def update

    if @person.update_attributes(person_params)
      redirect_to people_path, notice: "#{first_name} #{last_name} has been updated!"# and return
    end

    render 'edit'
  end

  def destroy
    @person.destroy

    redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" #and return
  end

private

  def set_person
      @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :notes)
  end
end