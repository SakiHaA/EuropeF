class Public::HomesController < ApplicationController
  def top
    @leagues = League.all
  end
end
