class PaidsController < ApplicationController
  before_action :set_paid, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def upvote
    @paid.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @paid.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  def index
    @paids = Paid.where(:user_id => current_user.id)
  end

  def new
    @paid = Paid.new
  end

  def create
    @paid = Paid.new(paid_params)
    @paid.user_id = current_user.id
    respond_to do |format|
      if @paid.save
        format.html { redirect_to @paid, notice: 'Sample was successfully created.' }
        format.json { render :show, status: :created, location: @paid }
      else
        format.html { render :new }
        format.json { render json: @paid.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update

     respond_to do |format|
       if @paid.update(paid_params)
         format.html { redirect_to @paid, notice: 'Sample was successfully updated.' }
         format.json { render :show, status: :ok, location: @paid }
       else
         format.html { render :edit }
         format.json { render json: @paid.errors, status: :unprocessable_entity }
       end
     end
   end

   def destroy
    @paid.destroy
    respond_to do |format|
      format.html { redirect_to paids_url, notice: 'Sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_paid
      @paid = Paid.find(params[:id])
    end

    def paid_params
      params.require(:paid).permit(:description, :audio,:user_id,:category)
    end
end
