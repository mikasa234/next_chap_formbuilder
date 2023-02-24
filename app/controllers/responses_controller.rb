class ResponsesController < ApplicationController
  before_action :set_response, only: %i[ show edit update destroy ]

  # GET /responses or /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1 or /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    # p session[:label_values]
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses or /responses.json
  def create
    result_hash = {}
    session[:label_values].each do |label|
      result_hash[label] = params[label]
      params.delete(label)
    end

    param_new_hash = {}
    #@ankita: hardcoded user_id for now for simplicity
    param_new_hash['user_id'] = 2
    param_new_hash['data'] = result_hash
    param_new_hash['title'] = session[:title]

    @form = Form.create(param_new_hash)
    if @form.save
      Rails.logger.info("response saved")
    end
    redirect_to "/forms"

  end

  # PATCH/PUT /responses/1 or /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to response_url(@response), notice: "Response was successfully updated." }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1 or /responses/1.json
  def destroy
    @response.destroy

    respond_to do |format|
      format.html { redirect_to responses_url, notice: "Response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
      
    end

    # Only allow a list of trusted parameters through.
    def response_params
      params.require(:response).permit(:data, :title)
    end
end
