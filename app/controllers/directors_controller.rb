class DirectorsController < ApplicationController
  def index
render ({:template=>"director_templates/list"})
  end

  def show
    the_id= params.fetch("the_id")
    matching_records = Director.where({:id=> the_id})
    @the_director= matching_records.at(0)

    render ({:template=>"director_templates/details"})

  end

    def junior
      all_directors=Director.where.not({ :dob => nil }).order({ :dob => :desc })
      @youngest_director=all_directors.at(0)
      render ({:template=>"director_templates/young"})
    end

    def senior
      all_directors=Director.where.not({ :dob => nil }).order({ :dob => :asc })
      @oldest_director=all_directors.at(0)
      render ({:template=>"director_templates/old"})
    end

  end
