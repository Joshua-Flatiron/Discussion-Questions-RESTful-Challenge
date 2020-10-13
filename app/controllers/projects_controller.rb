class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params(:name, :information))

        if @project.save 
            redirect_to project_path(@project)
        end
        
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])

        @project.update(project_params(:information))
        if @project.save 
            redirect_to project_path(@project)
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.delete

        redirect_to projects_path
    end

    private 

    def project_params(*arg)
        params.require(:project).permit(*arg)
        #params.require(:project).permit!
    end
end
