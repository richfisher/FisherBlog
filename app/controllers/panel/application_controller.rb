class Panel::ApplicationController < ApplicationController
  before_filter :authenticate_admin!

  layout 'panel'
end
