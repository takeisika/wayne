class HomeController < ApplicationController
  def top
    @tasks=Task.all
  end

  def about
  end
end
