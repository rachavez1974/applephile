require "spec_helper"
require_relative "../lib/craigslist.rb"


RSpec.describe "CraigsList" do  
let!(:cl_first) {CraigsList.new()}

  describe "#initialize" do
    it "it has default values, and visits the about page of craiglist to collect html" do
      cl_second = CraigsList.new()

      cl_second_site = cl_second.instance_variable_get(:@site_url)
      cl_second_doc = cl_second.instance_variable_get(:@doc)
    
      expect(cl_second_site).to eq("https://www.craigslist.org/about/sites")
      expect(cl_second_doc).to eq(cl_second.doc)
    
    end
  end
  
end


