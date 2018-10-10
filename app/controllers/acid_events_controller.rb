class AcidEventsController < ApplicationController

  def index
    @acid_events = AcidEvent.all

    @tcp_headers = Tcphdr.all
    @udp_headers = Udphdr.all
    @icmp_headers = Icmphdr.all
  end

  def show
    @acid_event = AcidEvent.find_by_cid(params[:id])
    @info_from_source_ip = Geocoder.search(@acid_event.ipv4_source)
    @address = @info_from_source_ip.first.address
    @lat = @info_from_source_ip.first.coordinates.first
    @lng = @info_from_source_ip.first.coordinates.last

    @whois = Whois::Client.new
    @whois = @whois.lookup(@acid_event.ipv4_source)
    @whois = @whois.parser

    @whois
    #@whois = Whois::Client.new
    #record = @whois.lookup(@acid_event.ipv4_source)
    #@whois_parsed = record.parser

    #c = Whois::Client.new
    #@whois = c.lookup(@acid_event.ipv4_source)

  end
end