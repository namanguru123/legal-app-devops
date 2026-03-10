class CasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_case, only: %i[ show edit update destroy ]

  # GET /cases
  def index
    @cases = current_user.cases
  end

  # GET /cases/1
  def show
  end

  # GET /cases/new
  def new
    @case = current_user.cases.build
  end

  # GET /cases/1/edit
  def edit
  end

  # POST /cases
  def create
    @case = current_user.cases.build(case_params)

    respond_to do |format|
      if @case.save
        format.html { redirect_to @case, notice: "Case was successfully created." }
        format.json { render :show, status: :created, location: @case }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cases/1
  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to @case, notice: "Case was successfully updated." }
        format.json { render :show, status: :ok, location: @case }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cases/1
  def destroy
    @case.destroy

    respond_to do |format|
      format.html { redirect_to cases_path, notice: "Case was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_case
    @case = current_user.cases.find(params[:id])
  end

  def case_params
    params.require(:case).permit(:title, :description, :status, documents: [])
  end
end