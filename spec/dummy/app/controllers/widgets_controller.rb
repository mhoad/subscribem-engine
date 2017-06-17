# frozen_string_literal: true

# This is an example class that I setup to demonstrate how resrouces that
# are scoped to the account are setup in order to provide the multi-tenancy
# features that the application requires. As you can see everything is
# just scoped by a database field so we can do things like current_account.widgets
class WidgetsController < ApplicationController
  before_action :find_widget, only: %i[edit update show destroy]
  before_action :authorize_user!

  def index
    @widgets = current_account.widgets
  end

  def new
    @widget = Widget.new
  end

  def create
    @widget = current_account.widgets.build(widget_params)
    if @widget.save
      flash[:notice] = 'Widget was successfully created.'
      redirect_to(@widget)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @widget.update(widget_params)
      flash[:notice] = 'Successfully updated widget.'
      redirect_to @widget
    else
      flash[:alert] = 'Error updating widget.'
      render :edit
    end
  end

  def destroy
    if @widget.destroy
      flash[:notice] = 'Successfully deleted widget.'
      redirect_to widget_path
    else
      flash[:alert] = 'Error deleting widget'
    end
  end

  private

  def widget_params
    params.require(:widget).permit(:name)
  end

  def find_widget
    @widget = current_account.widgets.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Widget not found.'
    redirect_to subscribem.root_url
  end
end
