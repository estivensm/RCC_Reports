class PagesController < ApplicationController
   before_action :authenticate_user!

  def home
  	@reports = Report.all.count
  	@size = File.size?( "app/controllers" ) 
  end
end
