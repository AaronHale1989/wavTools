class SamplesController < ApplicationController
  before_action :set_sample, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def upvote
    @sample.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @sample.downvote_by current_user
    redirect_back fallback_location: root_path
  end

    def index
      @samples = Sample.all
    end

    def new
      @sample = Sample.new
    end

    def create
      @sample = Sample.new(sample_params)
      @sample.user_id = current_user.id
      respond_to do |format|
        if @sample.save
          format.html { redirect_to @sample, notice: 'Sample was successfully created.' }
          format.json { render :show, status: :created, location: @sample }
        else
          format.html { render :new }
          format.json { render json: @sample.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
    end

    def edit
    end

    def update

       respond_to do |format|
         if @sample.update(music_params)
           format.html { redirect_to @sample, notice: 'Sample was successfully updated.' }
           format.json { render :show, status: :ok, location: @sample }
         else
           format.html { render :edit }
           format.json { render json: @sample.errors, status: :unprocessable_entity }
         end
       end
     end

     def destroy
      @sample.destroy
      respond_to do |format|
        format.html { redirect_to samples_url, notice: 'Sample was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

      def set_sample
        @sample = Sample.find(params[:id])
      end

      def sample_params
        params.require(:sample).permit(:title, :audio,:user_id, :category)
      end
end
