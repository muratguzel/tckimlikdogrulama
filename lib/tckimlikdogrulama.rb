#encoding:utf-8
require "tckimlikdogrulama/version"    
                           
require 'savon'
require 'unicode_utils'

module Tckimlikdogrulama 
          
    module ClassMethods         
    
      def tckimlikno_dogrula(options = {})
         client = Savon::Client.new("https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL")
         res = client.request(:tc_kimlik_no_dogrula) {soap.body = { "TCKimlikNo" => options[:identification_number], "Ad" => UnicodeUtils.upcase(options[:first_name], :tr) , "Soyad" => UnicodeUtils.upcase(options[:last_name], :tr), "DogumYili" => options[:birth_year]}}
         unless res.body[:tc_kimlik_no_dogrula_response][:tc_kimlik_no_dogrula_result]
           false
         else
           true
         end
       end               
    
    end

    module InstanceMethods
    
      def tckimlikno_dogrula(options = {})
        client = Savon::Client.new("https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL")         
        res = client.request(:tc_kimlik_no_dogrula) {soap.body = { "TCKimlikNo" => self.identification_number, "Ad" => UnicodeUtils.upcase(self.first_name, :tr) , "Soyad" => UnicodeUtils.upcase(self.last_name, :tr), "DogumYili" => self.birth_year}}        
        unless res.body[:tc_kimlik_no_dogrula_response][:tc_kimlik_no_dogrula_result]
          false
        else
          true
        end
      end       
    
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end

end

         
class ActiveRecord::Base
  include Tckimlikdogrulama  
end
