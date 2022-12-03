class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @books=@user.books
    @book=Book.new
  end

  def index
    @users=User.all
    @user=current_user
    @book=Book.new
    @books=Book.all
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="Profile was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
