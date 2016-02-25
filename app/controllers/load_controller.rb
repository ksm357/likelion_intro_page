class LoadController < ApplicationController
  def main
  end

  def ok
    redirect_to "/home/index"
    # render :js => "window.location = '/home/index'"
  end
end
