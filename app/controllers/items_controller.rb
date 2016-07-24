class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @items = @user.items.build(items_params)

    if @items.save
      flash[:notice] = "To-Do item successfully saved."
      redirect_to @user
    else
      flash[:error] = "Error saving To-Do item."
    end
      return
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      redirect_to user_path(current_user), notice: 'Task Done!'
    else
      flash[:error] = "Failed to Delete items"
    end
      return

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def items_params
    params.require(:item).permit(:name)
  end
end
