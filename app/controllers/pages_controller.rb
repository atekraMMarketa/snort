class PagesController < ApplicationController
  def welcome
    @sensors = Sensor.all
    @acid_events = AcidEvent.all.first(10)
    #@acid_events = AcidEvent.find(:all, :order => "id desc", :limit => 10)

    #@snort_data = SnortData.all
    #@events = Event.all
    #@acid_events = AcidEvent.all
    #@detail = Detail.all
    #@icmphdrs = Icmphdr.all
    #@signatures = Signature.all
    #@tcp_headers = Tcphdr.all
    #@udp_headers = Udphdr.all
    #@icmp_headers = Icmphdr.all
  end
end
