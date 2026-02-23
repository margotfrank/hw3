class EntriesController < ApplicationController
  def new
    @place_id = params.fetch("place_id")
  end

  def create
    @entry = Entry.new
    @entry.title = params.fetch("title")
    @entry.description = params.fetch("description")
    @entry.occurred_on = params.fetch("occurred_on")
    @entry.place_id = params.fetch("place_id")

    if @entry.save
      redirect_to("/places/#{@entry.place_id}")
    else
      redirect_to("/entries/new?place_id=#{@entry.place_id}")
    end
  end

end
