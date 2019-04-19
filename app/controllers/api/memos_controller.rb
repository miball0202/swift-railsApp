class Api::MemosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create #一時的にトークンを回避

  def create
    memo = Memo.new(create_params)

    unless memo.save
      @error_message = [memo.errors.full_messages].compact
    end
  end

  private

  def create_params
    params.permit(:text)
  end
end
