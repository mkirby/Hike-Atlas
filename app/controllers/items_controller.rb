class ItemsController < ApplicationController
    before_action :find_item, only: [:show, :edit, :update, :destroy]

    def index
        #displays all items owned by a single user
        #need to set to @current_user
        @items = User.first.items
        @categories = Category.all
    end

    def show
        #do we need an item show page?
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
        if @item.valid?
            #verify were we redireect to
            redirect_to user_path(@item.user)
        else
            flash[:errors] = @item.errors.full_messages
            redirect_to new_item_path(@item)
        end
    end

    def edit
    end

    def update
        if @item.update(item_params)
            #verify were we redireect to
            redirect_to user_path(@item.user)
        else
            flash[:errors] = @item.errors.full_messages
            redirect_to edit_item_path(@item)
        end
    end

    def destroy
        @item.delete
        #verify were we redirect to
        redirect_to user_path(@item.user)
    end

    private

    def find_item
        @item = Item.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:name, :description, :weight, :cost, :condition, :note, :url, :user_id, :category_id)
    end
end
