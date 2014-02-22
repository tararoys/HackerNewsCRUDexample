require 'spec_helper'

describe Tea do

      context "when creating an empty user that you don't want to insert into the database yet" do
      it "should tell a tester hello" do
        
        tea = Tea.new()
        expect(tea.hello_testers!).to eq("hello_testers!")

      end   
    end

end
