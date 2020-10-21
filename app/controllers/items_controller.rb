class ItemsController < ApplicationController
    before_action :find_item, only: [:show, :edit, :update, :destroy]

    def index
        #displays all items owned by a single user
        @items = @current_user.items
        @categories = Category.all
    end

    def show
    end

    def new
        @item = Item.new
        @categories = Category.all
    end

    def create
        # @current_user.items << Item.create(item_params)
        @item = Item.create(item_params)
            if @item.valid?
            redirect_to items_path
        else
            flash[:errors] = @item.errors.full_messages
            redirect_to new_item_path(@item)
        end
    end

    def edit
        @categories = Category.all
    end

    def update
        if @item.update(item_params)
            redirect_to items_path
        else
            flash[:errors] = @item.errors.full_messages
            redirect_to edit_item_path(@item)
        end
    end

    def destroy
        #find all hikeitems related to a single item
        all_hike_items = HikeItem.all.select { |record| record.item_id == @item.id}
        #destroy each join table record
        all_hike_items.each { |record| record.delete}
        #delete the item 
        @item.delete
        redirect_to items_path
    end

    private

    def find_item
        @item = Item.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:name, :description, :weight, :cost, :condition, :note, :url, :user_id, :category_id)
    end
end
