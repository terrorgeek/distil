require "socket"
class DomainWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  def perform(domain_id,op="find",params=nil)
    @domain=Domain.find(domain_id)
    if op=="find"    
       get_origin_ip(@domain.origin_ip)
    end
    if op=="update"
       @domain.update_attributes(:hostname=>params["hostname"].to_s,:origin_ip=>params["origin_ip"].to_s)
    end
    if op=="destroy"
       @domain.destroy
    end   
  end
  
  def get_origin_ip(ip)
    path=Rails.root.join('tmp', 'result.txt')
    fp=File.new(path,"w")
    fp.write("This is the origin ip:"+ip)
    fp.close
  end
end