class FieldsController < ApplicationController
  before_action :set_field, only: %i[ show edit update destroy ]

  # GET /fields or /fields.json
  def index
    @labels = session[:labels]
    @fields = Field.all
  end

  # GET /fields/1 or /fields/1.json
  def show
  end

  # GET /fields/new
  def new
    @field = Field.new
  end

  # GET /fields/1/edit
  def edit
  end

  def show_labels
    session[:title] = params[:title]
    session[:label_values] = []
    session[:labels].each do |label|
      session[:label_values] << params[label]
    end
    # Rails.logger.info("Saving form")
    # Rails.logger.info(params)
    
    redirect_to '/responses/new'
  end

  # POST /fields or /fields.json
  def create
    # Rails.logger.info("in create")
    # Rails.logger.info(params)
    # @field = Field.new(field_params)

    # respond_to do |format|
    #   if @field.save        
    #     session[:label_values] = []
    #     session[:labels].each do |label|
    #       session[:label_values] << params[label]
    #     end

    #     # redirect_to '/responses/new'
    #     format.html { redirect_to '/responses/new', notice: "Form was successfully created." }
    #     format.json { render :show, status: :created, location: @field }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @field.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /fields/1 or /fields/1.json
  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to field_url(@field), notice: "Field was successfully updated." }
        format.json { render :show, status: :ok, location: @field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fields/1 or /fields/1.json
  def destroy
    @field.destroy

    respond_to do |format|
      format.html { redirect_to fields_url, notice: "Field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def field_params
      params.fetch(:field, {})
    end
end
