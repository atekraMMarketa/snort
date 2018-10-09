class PagesController < ApplicationController
  def welcome
    #@snort_data = SnortData.all
    @events = Event.all
    @detail = Detail.all
    @icmphdrs = Icmphdr.all
    @sensors = Sensor.all
    #@signatures = Signature.all
  end
end
