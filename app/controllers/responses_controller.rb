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
    data_json = result_hash.to_json
    params['data'] = result_hash
    # params['user_id'] = 2
    params['title'] = session[:title]

    Rails.logger.info("saving response")
    Rails.logger.info(params)

    @response = Response.new(params)
    # @response.data = result_hash

    # @form = Form.new(params)
    # @form.title = session[:title]
    # @form.response = @response
  
    Rails.logger.info("saving the form")
    if @form.save
      Rails.logger.info("form saved")
      format.html { redirect_to response_url(@form), notice: "Response was successfully created." }
      format.json { render :show, status: :created, location: @response }
    else
      Rails.logger.info("form could not be saved")

    # respond_to do |format|
    #   if @response.save
    #     format.html { redirect_to response_url(@response), notice: "Response was successfully created." }
    #     format.json { render :show, status: :created, location: @response }
    #   else
    #     Rails.logger.info("db save error!!")
    #     Rails.logger.error(@response.errors.full_messages.join(', '))
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @response.errors, status: :unprocessable_entity }
    #   end
    end
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
