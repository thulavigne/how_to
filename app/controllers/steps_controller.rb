class StepsController < ApplicationController

before_filter :find_project
before_filter :find_project
before_filter :find_step, :only => [:show, :edit, :update, :destroy]

def new
  @step = @project.steps.build
end

def create
  @step = @project.steps.build(params[:step])
  if @step.save
    flash[:notice] = "A new step has been created."
    redirect_to [@project, @step]
  else
    flash[:alert] = "New step has not been created."
    render :action => "new"
  end
end

def find_step
  @step = @project.steps.find(params[:id])
end

def show
end

def edit
end

def update
  if @step.update_attributes(params[:step])
    flash[:notice] = "This step has been updated."
    redirect_to [@project, @step]
  else
    flash[:alert] = "This step has not been updated."
    render :action => "edit"
  end
end

def destroy
  @step.destroy
  flash[:notice] = "This step has been deleted."
  redirect_to @project
end

private
  def find_project
    @project = Project.find(params[:project_id])
  end

end
