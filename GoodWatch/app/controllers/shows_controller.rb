class ShowsController < ApplicationController
    def index
        @shows = Show.all
        @shows = @shows.order(:title)
        searchfield = params[:title_search]
        @shows = @shows.where('title LIKE ?', "%#{searchfield}%") if !searchfield.nil?
        if @shows.empty?
          flash[:notice] = "No shows exist by that name"
        end
      end
    
      def show
        @show = Show.find(params[:id])
      end
    
      def new
        @show = Show.new
      end
    
      def create
        @show = Show.new(create_update_params)
        if @show.save
          flash[:notice] = "Show #{@show.title} successfully created"
          redirect_to shows_path
        else
          # save failed
          flash[:alert] = "Show couldn't be created"
          render 'new'
        end
      end
    
      def destroy
        @show = Show.find(params[:id])
        @show.destroy
        flash[:alert] = "#{@show.title} has been destroyed"
        redirect_to shows_path
      end
    
      def edit 
        # not sure about edit method, maybe someone can review because doesn't seem complete
        @show = Show.find(params[:id])
      end
    
      def update
        @show = Show.find(params[:id])
        if @show.update(create_update_params)
          flash[:notice] = "Show #{@show.title} successfully updated"
          redirect_to show_path(@show)
        else
          # save failed
          flash[:alert] = "Show couldn't be updated"
          render 'edit'
        end
      end

      private
    
      def create_update_params
        params.require(:show).permit(:title, :creator, :number_of_seasons, :year, :episodes)
      end
    
      def record_not_found
        flash[:alert] = "No such show exists"
        redirect_to shows_path
      end
end
