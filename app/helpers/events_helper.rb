module EventsHelper
    def event_params
        params.require(:event).permit(:date, :description)
    end
end
