class FormsController < ApplicationController
  before_action :set_form, only: %i[ show edit update destroy ]

  # GET /forms or /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1 or /forms/1.json
  def show
  end

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
  end


  def form_submission
    @form_data = params
  end

  def store_labels
    session[:labels] = []
    params[:label_count].to_i.times do |i|
      session[:labels] << "Field #{i+1}"
    end
    @labels = session[:labels]
    p @labels
    redirect_to '/fields/new'
  end

  # POST /forms or /forms.json
  def create

    # redirect_to controller: "forms_controller", action: "input"
    # format.json { render :input, location: @form }
    

    # @form = Form.new(form_params)

    #respond_to do |format|
      # # if @form.save
      # #   format.html { redirect_to form_url(@form), notice: "Form was successfully created." }
      # #   format.json { render :show, status: :created, location: @form }
      # # else
      # #   format.html { render :new, status: :unprocessable_entity }
      # #   format.json { render json: @form.errors, status: :unprocessable_entity }
      # end
    # end
  end

  # PATCH/PUT /forms/1 or /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to form_url(@form), notice: "Form was successfully updated." }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
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
