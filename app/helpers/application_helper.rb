module ApplicationHelper

    def render_flashes
        turbo_stream.prepend "flashes", partial: "layouts/flash"
    end
end
