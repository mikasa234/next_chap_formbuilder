class FormsController < ApplicationController
  before_action :set_form, only: %i[ show edit update destroy ]

  # GET /forms or /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1 or /forms/1.json
  def show
    @form = Form.find(params[:id])
  end

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
    Rails.logger.info("in edit")
    @form = Form.find(params[:id])
  end

  def show_response
    Rails.logger.info("showing response")
    Rails.logger.info(params)
    @res = Form.find(params[:id])
    if @res
      @form = Form.show
    end
  end

  def store_labels
    session[:labels] = []
    params[:label_count].to_i.times do |i|
      session[:labels] << "Field #{i+1}"
    end
    @labels = session[:labels]
    redirect_to '/fields/new'
  end

  # POST /forms or /forms.json
  def create
  end

  # PATCH/PUT /forms/1 or /forms/1.json
  def update
    Rails.logger.info("in update")
    Rails.logger.info(params)

    @form = Form.find(params[:id])
    form_update_data = {}
    params[:form].each do |key, value|
      form_update_data[key] = value
    end
    Rails.logger.info(form_update_data)
    # @form.data = form_update_data.to_json


    Rails.logger.info(@form)

    if @form.save
      redirect_to @form
      # format.html { redirect_to form_url(@form), notice: "Form was successfully updated." }
      # format.json { render :show, status: :ok, location: @form }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @form.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /forms/1 or /forms/1.json
  def destroy
    @form.destroy

    respond_to do |format|
      format.html { redirect_to forms_url, notice: "Form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def form_params
      params.require(:form).permit(:title, :data, :user_id)
    end   
end
