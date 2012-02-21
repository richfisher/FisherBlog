class PartnerCell < Cell::Rails

  def sidebar
    @partners = Partner.all
    render
  end

end
