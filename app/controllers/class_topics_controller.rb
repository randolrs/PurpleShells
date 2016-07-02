class ClassTopicsController < ApplicationController
  before_action :set_class_topic, only: [:show, :edit, :update, :destroy]

  # GET /class_topics
  # GET /class_topics.json
  def index
    @class_topics = ClassTopic.all
  end

  # GET /class_topics/1
  # GET /class_topics/1.json
  def show
  end

  # GET /class_topics/new
  def new
    @class_topic = ClassTopic.new
  end

  # GET /class_topics/1/edit
  def edit
  end

  # POST /class_topics
  # POST /class_topics.json
  def create
    @class_topic = ClassTopic.new(class_topic_params)

    respond_to do |format|
      if @class_topic.save
        format.html { redirect_to @class_topic, notice: 'Class topic was successfully created.' }
        format.json { render :show, status: :created, location: @class_topic }
      else
        format.html { render :new }
        format.json { render json: @class_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_topics/1
  # PATCH/PUT /class_topics/1.json
  def update
    respond_to do |format|
      if @class_topic.update(class_topic_params)
        format.html { redirect_to @class_topic, notice: 'Class topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_topic }
      else
        format.html { render :edit }
        format.json { render json: @class_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_topics/1
  # DELETE /class_topics/1.json
  def destroy
    @class_topic.destroy
    respond_to do |format|
      format.html { redirect_to class_topics_url, notice: 'Class topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_topic
      @class_topic = ClassTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_topic_params
      params.require(:class_topic).permit(:parent_topic_id, :name, :url)
    end
end
