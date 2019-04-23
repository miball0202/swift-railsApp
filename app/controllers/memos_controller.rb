class MemosController < ApplicationController
  load_and_authorize_resource
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  def index
    @memos = Memo.accessible_by(current_ability)
  end

  def show
  end

  def new
    @memo = current_user.memos.new
  end

  def create
    @memo = current_user.memos.new

    respond_to do |format|
      if @memo.save
        format.html { redirect_to @memo, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @memo }
      else
        format.html { render :new }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @memo.update(note_params)
        format.html { redirect_to @memo, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @memo }
      else
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def note_params
    params.require(:memo).permit(:user_id, :text)
  end
end
